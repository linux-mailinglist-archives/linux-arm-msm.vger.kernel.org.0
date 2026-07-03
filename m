Return-Path: <linux-arm-msm+bounces-116284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 529yMEuYR2o7bwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:08:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B995701A0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:08:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C27DU2eB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KgHf7cy2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116284-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116284-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A60C1300420F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027FA3A7F7E;
	Fri,  3 Jul 2026 10:50:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB839E6F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:50:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075828; cv=none; b=dQFJAbp9zOODlJlh2rv/aAwI1oBiIyzWkCZzOQQb1aDPgvTi4srgNGglyBwNL0kqXoFK7QU5tqvhVXQhxKg8nB60jy6xkgsq705syxmGvwfSxu69KGE6BsAqaTAX45RL3aVdjo6XdG0sKRlRJY+oHBsizS8vvIoxlXGE+sspQI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075828; c=relaxed/simple;
	bh=sLvK9FUnFoSATdcnQ1dFAeGQbdgeVwtcU7iPxUH8xtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDPQha7fTECg59XdyOklBdsta8h7zpkIy0mj8v4axw1i+Y2hUUVlTi+HBoKk0HXBx244wE25DsLfNCbDztUn+kL94Jw3EQcvuPD8PNurvUkd1t9yUT9UspIpxIarwU4DJuHmhkFsWwwXHYRDfoUav4qx6z1xksVMkuemimjVFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C27DU2eB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgHf7cy2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rw8P3126390
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=; b=C27DU2eBUaXJioho
	Xh335HYQLZie0n6MxTCWCKr78kuzTDgVy+L9vVTTXorrp62JwVXlp6fxTOSxy2mO
	yxe4wPxzKWZh+xAvZsLidrJto4hg7MnXRVEESTUpEG9JFIZU3Td+RpMA3uHJPyxm
	5RSMHrhDmdzAE9v9oFp7/YzKLLqeU/dt20Ig44XVoAdFZfisAI3YQfsu3GdxVO6e
	+8IEvjg+TAACPtXpNOj3w2Ecdxzv0uaGdIXta1IwobqSBj+4zwojHw9i0V4pJnJK
	NUb/llCLUx26gW/N9D7SJl15lLhZq26/w/MtF9h7YqCHsq+FhnwqXIqIliFS78RB
	fFwrJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm24y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:50:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efd48cbe2eso1017996d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075826; x=1783680626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=;
        b=KgHf7cy28JsGpncMNV9G0wBQfBt2N6QtJ+3wg7ylitPMyF+rO1XSj4Wv39i4eS/1ui
         HvLChPalIt++k+c73gPe+keSDalDJAVnAGY3rfkRDnh/k7D9T8jsWl0aqve+jqL2REI0
         DZST8pzd9mz8Ceo0fqgfq0CvwNyF1J3bZzkj7FQLqT1gxoLkqHH2aMi3pafw04GeLm9h
         NcTR2OIQFYlF4IMmcWHcrLN/fWA4XR5BkuEWlXmuskvkiacFtb+b8UnWN0xhlsGLQYzn
         JWj7/atwRoNaY0WCWKez5RynMo8BFQNsBZlapblQfNKrReAVHyfCbiIWqY/wdRn2qywb
         qKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075826; x=1783680626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35THU6IAqawmCI+7sWflRA2CBA8FlrZ4eHuYrX/Up0w=;
        b=aqC6YQRKDG7NSxKiDE61sdKW3y193IRTU6GTUjrOEu4Qh7hP22px6x0xoQKpEcTyUl
         HeqhUjEWMnLgFATIHCdirCwZpXMtw9mDMVzUto5wWCYsYRJ6lNWewffoVKpTIqL/QeCm
         d/hJQ85Q0BqYAendFDi2YuzinG29I1QSFg1JDciakwJOMiowT2MP0LAo5Mr02w8PCc+m
         n+rAx/1H6ZFVtG1R+Qx9alYFy1JHq7I7aJWSRdKM9ufgjN4c0FwWCDekkxpMartmjxt/
         zCn4wZlu1g1p1FT6cGeCcHvnC7+LU3MjM/lfdhaQAewSL1A2MmEZEQpuYaLlMNz1DkKB
         GbiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl6Y3ZKzSJxQOSRHtCqsWbQwm+AaB2TtHmQoDDyI9iJwl6H+P2wKABVSM2rvb4dBmdX83h31Hx3QTZqCUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkZTm5aX+41BQaJCrM/MHKH6PpGcSzncPm6FuwvPr7ETel9w1
	Hp6RvQMbh4lwaemf+6E1JjszZj7vXiYFvq+RePtt8D5lJYPDT+KzftrKtD7tWgvJFxgKBDYsWBJ
	hb6ytjTXMs3omfAFzzK9d7daULLFGr+RluVg68U2SI98vNn8Fdzua9CXVqjtZo0Q/VHOO
X-Gm-Gg: AfdE7ckWHjESKqcwhDdz2J3T/TXGl403DacZUZ8g2+PODmfYY2SUiLm+84GA+LWVTvI
	aj5wkqPaL6Ui2EyZjCdHMBaIEfzCGHtAXB5KFWlETkhwDLaSQurEbfyWTJMT1zMQqh3jP0693B5
	ryeZpB0un2GOUFkejzmb96n0VKHupvG9Z5EJcL9offIOzespn24ugH2EDMRZhbtPy0ETy9XT/oN
	SnaWc5FS9qbICM0Cyp032XBdGFO68OgZ/k/Q6aQWqjlWYA3gz8pdwh66/GTViRqAvO9xMIsPl1k
	gssicRur4MQVXKvCDK19LueS5DDlpVuhREIWcE/L4YZjwDCafugRKh4aqUyYXW7swIQxRtiAXpe
	sEmH1VZEKZzreRrd7CAhKolbM7UPBLoTAeYo=
X-Received: by 2002:a05:6214:61cf:10b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-8f3c9abaac7mr61818016d6.10.1783075826015;
        Fri, 03 Jul 2026 03:50:26 -0700 (PDT)
X-Received: by 2002:a05:6214:61cf:10b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-8f3c9abaac7mr61817826d6.10.1783075825578;
        Fri, 03 Jul 2026 03:50:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf22e07sm2309404a12.7.2026.07.03.03.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:50:24 -0700 (PDT)
Message-ID: <e644949d-e5f2-489c-bbc4-8204914af958@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:50:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wV3SWfcsx9w47bDyjiMec_J_9V0SHlZz
X-Proofpoint-ORIG-GUID: wV3SWfcsx9w47bDyjiMec_J_9V0SHlZz
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4793f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX+jK5wWGGDQeC
 Ull3h/l4RsJqMQSNMtDps85wf/dHX/Tz60FkgyPEkuul9kUMELxqwtR93cnJ9ElLZVPmsIiIxAf
 wePzc/waUzcdgmUuE202lXoc757/i+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX42oT8VWiQm4z
 k7mLnUVUzVk3UvHtnR2wZr7Wb0Ba3YmHBKl/uU37ACLySYKsUHrVKmADRScVAAOK8xnG+pameqH
 G/U0oUB+6XzZgDEAFbcFLdOZqpfeTHdBlghO3crF813E6DxRHv+M7eGN86Obn/63FIEIKzGNomc
 P7aLVPEFMdfeFV6WpDamAdcVjO3Cd0aekoTUqNYjEVM9xH7JeTqeMlMYsLjBQ7nsmEPbsmpfs2B
 5sCv507ERqi35/q5oHFdB4YMtjFI9MPl2wHwDX/IquPoO2/IsydotrxiayENi7NEXY43y+ZWSwT
 gCbyDMAfTEvNvK1unQRsiIVLVdfWhpZ0cNfGDxx9c0Tw0jiInJJskScACqgdbEohJT+LhSrh0ob
 GW8GPFinhfZJu5kfqAYIDFf6l9BAnNLs3UMJ47v56Sj45ESaPPlnzk9pwMXFaYHTfgLRVp/qk21
 d6ZDrnibdSr3AQ4W8+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116284-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3B995701A0A

On 7/2/26 11:40 AM, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Please switch to using the b4 tool and run `b4 trailers -u`
before sending the new revision to make sure you pick up review
tags

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

