Return-Path: <linux-arm-msm+bounces-113714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IsbLirAM2oTFwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:53:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018369F052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aQFd8ZVs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZVWok5VW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D059309154A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6C23C1F4B;
	Thu, 18 Jun 2026 09:49:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D343E8346
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776156; cv=none; b=qjp2gVvYX5WYNlDUCo5Y8aMAzzuDQmvidgv5X+Dv/2YT1dUXsRFyJALbHCJ8H7BH4C/4lRt1YTeqGJK1MZn9jlMGFqhuv5CJmiPqTIRjttlimxJKpjIdbvzStYJheRPQm8B+zc7Ok08KxjAXkeTClaaCEHyc4iMlatN3/MUAgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776156; c=relaxed/simple;
	bh=CqOnzpYUZ8jTECcLckHB51CXBNWr7PZ6ZzF5YP4P+74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MY8KIvMPmI0ltx/plN/DxJxqnfgUgi9245jAUUCaBoKz3BF9Q3734Z5fvume1FhTB8FlKEPHUlmKJehIY/VPmMElzsrlYt/X93IVPY0KzKRlXy2X79UOAulQDv3angrW1Fb4MHTwmPe4xyLWZU4ONrPcvsPW0QaFUG4xlyEGXG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQFd8ZVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVWok5VW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I98p4T1363639
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=; b=aQFd8ZVsz0D6yGsv
	fxnVX2h5MqNYRkCRULpH519JHRTA+ug1V9C9aqvcqyLTgsHYk+iwB8pGxuoTO8vT
	s+oBCLAm9IlieNsyIkXWaKq9MN2Xyw8i8T7r8+M/WNlA77+OUjYHsLIsl2qfDov3
	ZNVqisZIBwsleFaS+nmHO3VxCfPw+5hQQWSeWYe++na9O82l5NIWECs4YFKyuy3D
	oybKgDHA3OHzYdCEa+eJdLihuZhdQxKMc6OA/vJ3c++Sni14xxdUhNgapXSK6HJE
	8HW02CvstE1lrm9t/dBFYg4vDjLG5c/BnuOJh6I3keon+eENpa7ukpk/iSrYLa1O
	VlZJSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2juyr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:49:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso21778685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781776150; x=1782380950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=;
        b=ZVWok5VWVtsi8Ljua1P0NHO5Hry6MGek+BlBKRUwo1zZtPVP5zIXEgLowHiEb1sN/U
         gNe1B0upoQf1WZ8dCMEO0+snUHlWPDhD4BvW8lzJrjlklrWTnTkAPEf5Kg8D/e1uxjUt
         Ri169WJhl8BvqrwemoTiQXcI9IZVHZZ3xHqUlblsKSKPaUtlGsVPfOE54I/nhmtJiiGG
         k+CXlo25QLTvK6BRY6q8H/gQyxnxPXetzUGU8UjbuYeY/lO00TRGKPzBBvwP975dILUQ
         d74NooesONLE/MRH7jwerfm4N+MRqCnmrJhZUwMoqMg1PujgStLBxIRIsswhTAkq65jO
         +OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776150; x=1782380950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=;
        b=HQJuHhmC+VElYEPs3TasjlBcNRQ3VlVtX01/dmC61yOLCKZ9rPkFJQ3qzEB9EqQXA6
         /ZXwxBZnqT9KXIt9eCqCzPXRXYephQPm6wm4k0vud1ZUAfNf1qTw7J1uC347o9V+SmNm
         hZ9XX9Mpk+fTVdS9WozseE6LUdw4/dZhE69VPnQq+gJW3QSEKtRvUSCGybqFp9OKO6wu
         iQ9QY7LcTww0S+UMCjDFze0CSi9ueCHJ1phUNuCgbF2W100a9jZu5ijuAc23S+RcfS+B
         3wypoatNQgBoQbpWJ6UYtCz06Isl31tdWAWQtIwIyAZ+A666UvJ6+i59vnzabCHsEeb2
         vYeA==
X-Gm-Message-State: AOJu0Yyc8IWb070bTaLL+qQHan//qELhbn6lVcVgCkRLyx7eDZoIl9YD
	7KM0P2ioRFzH7g7mei0cEdPx2ofCv9JdMn4QLbjUITXgoYRECWtvJDAfcI6C+wthcY3dxOI1QcB
	bRdAxRrUVl63L6IzZ+0g1+5Skh3yba6IHcONB+c1ENmW37mYNSFzhTavWoaa1FrsMwBQK
X-Gm-Gg: Acq92OFsS2+DGEGNbjBy2Ar+5OB1SafBmN80GABFBEsBS/VXSYJiZO7TDC7R9NlGEIF
	lEr7DZxGquw9kR5mGubdeMr0zIyiEjfLb4gqGyCrPlTQHgyIpDHevm/2AuHTSHoAeJ5IfJCDz6/
	c67Rjwww6vfvK1GSPh219COxBllKC7fub/XUzerX1+DSBb35o9eBDVDG5w/oP7WRO0HAx0FNDdN
	FC1uMUp7DuBP34+fs3tRmIp3/nTWfOSrIvShC5Q6OYV59qXMKE8UHMk60h+B9FOL2mmjcHn87Dy
	cIhO3TJjYro1CsLLqQfbadTSJtU5z02Nr1/1fXSPzrJoKMcMxmounpSCUiKtYnVS4KsyY/PwwD2
	kojTiZYrSlYuWJhWDNDwQTfXKZwvyXjaRiDQ=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281466485a.0.1781776150227;
        Thu, 18 Jun 2026 02:49:10 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281464585a.0.1781776149836;
        Thu, 18 Jun 2026 02:49:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6de2dsm919473466b.37.2026.06.18.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:49:08 -0700 (PDT)
Message-ID: <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:49:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
 <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX4oekiZjXen4z
 ZxSxum+ArEx60o6kcq8oRetST5YYPuFrXIgWRFEd7xY33XD7+a5lBALvo+QoNGWI4WWzOaI4mHV
 h8RYHx8rVJL52ts8W2yeF6tsBqnp7GDfEDIxUUOvolf+H6wkU78rkKmzKprIorB7WSJC2EyK+6q
 8M+mhtvp1r3AQ0Ku52hNP52l0MrBafMGtjc4ubPuWYzgpADhF0oYokQ3BZFW5fbjmlI7gNzYzGJ
 xLEoX2AOqgxvB6P6Eo9J7srQRIS0R3pz2axRhsyJtofdfG9vrQL+9kq6pj12ltZz051SG/5NNS9
 LVykX3VhcTCs/8Tig2rQzIxCZjLX2xXPpu7TtqkhLv09TZRbUDdIQUm8o/bp3jYSRGCWunBXyBA
 6AcBWPjDobyrymOwqUUBnB8pGA2nL7U8fBpoueSPzQACfYGdsTueeyeoWv5GFGczudCZr18/zzb
 xCIw7jfU2PScG4YDt/g==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33bf16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=JePoLz6rm3lXWa06D34A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RSsq0XoT66JI0deoa3_QH0c7AMRdsO7q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX2CpjwkhXhHXb
 DYL9EeDMe4BLewgx0d/ybFoTs6aNX2RmTrpcVs7Tm0Eal2kOVfZJbKbwZI8CstlxhMKtD6eFwGC
 gwwruMk7AZbE/Pydt2XPcm4VZGhT9CA=
X-Proofpoint-GUID: RSsq0XoT66JI0deoa3_QH0c7AMRdsO7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113714-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4018369F052

On 6/8/26 11:17 AM, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> lemans.dtsi to allow the PCI subsystem to associate the DT node with
> the PCI-to-PCI bridge device.

Ideally this would be a separate change

Also, b4 can't grab this patch since there's something wrong with the
threading (multiple series in a single thread) - please switch to using
b4 for submissions yourself to avoid such mistakes.

https://b4.docs.kernel.org/en/latest/

Konrad

