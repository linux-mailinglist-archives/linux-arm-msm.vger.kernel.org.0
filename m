Return-Path: <linux-arm-msm+bounces-114182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tlTcBzZtOmoy8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C46B6B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:25:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IPq+qeqy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fH4YsJZt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114182-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114182-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6717D30BDC23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D47A3D3D05;
	Tue, 23 Jun 2026 11:24:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504D3D3D07
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:24:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213843; cv=none; b=flYKaCKeca5Hxk3IOlE3AY77buAFhVIWqXlbymRT940T5cb/lnPBNIM1RHmBKUYbJM9H//TY92Eg2tUmjAOTxTqhrFcij0eKi1IatPbjJB8Pl+B7FkLlsc7rpemP8wOTalp5XstYAfpWVNo3ELHUO2BqlyhMmbRCkNBzwdNjS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213843; c=relaxed/simple;
	bh=U3No7mwzLyHYxQXHWsBYQXeEGf2II5g9zdHV+6e5Up0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjNlpJQDIJ6bbDl9SJo0q+1oFnmFXg9u2t54SDQqAwm2Iqo+S7sCLwIiivBbjeIiCvdiIBjJPToI8+jKViKLrjf0E+LOSpIWQqcINetLQX4Xw7OQNJeL/QMXsgto3ygZ1GOVX21ENMIhVc/6U+Ee3ESYhIh+Vp8VjEMIBYSkUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPq+qeqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fH4YsJZt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsPxL3962314
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=; b=IPq+qeqyGUNGovDQ
	kx+2aD87MN+8HoH31PFrPKnPqz0xDKddnVrv3hNBiid/6r9CP6VFhM8b8+6APgZo
	SrogivjLXUDuuJ7fhKFK2DFoyqpsOvdWLQMoE+RB/c4V/qoHR7To9a2DUjEEOefE
	SFzyRO/R6bzxW2133BJa7mvgF/Svb2AGRLaW6TFrfumCdk39N8bl0Fxi6/0AvCYt
	VSPi5BWiU0bGbqI+or6T3hHsH5FmRyzAMi/yovf8RRxQ8sQvOu5iXnF5FTzFPrTO
	sJQsDmdJ6kk9w/Ox0EAz5Nw8gqwVQaG6azyN9APhO9PNclxB/RWUgx6f8o66u1GA
	11Wbhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yr77k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:24:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-519fe742290so2257261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213840; x=1782818640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=fH4YsJZtpBOZVjRuE1n9IHVYN5utchqim/csmPk+1SeEiBCBMh9UU6jw8/LqVtifyi
         M5IPsDUzVX2IUAkgeyhrfWNjR0mD9r6rmVxevW7tt0yued+986D+1X1Aq9/5zjHZs+gn
         ZzpDvKjp99F//6akLdNZXQxq+MX31dyRVzGiZTT9hll/GnIwq9vLxAhDDHbm8cUhlNms
         nasP8s+qJMlPy7DwMdOay4APPZ+XnlTzkS8O5gqmwAs5LzkPLctI/vvdRwcd+WkHV0WA
         aT3bEC2r1NkXqYnXxYOqpkKUuz/HQXMVFXkos8tSA3xIGJmPVhRQW+AXwkGD4VKOM7T1
         QqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213840; x=1782818640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=LaaKkhDtkCJ9thM9IuTK5b5gwTSleQyHgJpuNBkVbTlV4jcL4kr0WLuPN6jbdyl/NN
         0HQ48rM291eIzqwlCumVqP5OWC1Gm+akACuRQLYpvH1GgNMLYwj2sXxj2YVMjeMvxvsY
         Q/t7VVdHW7gSMjvl83s73j2lq6c8HZkCKBa0WcHwQcDJgMSDN1T2FR/kDOU1B3S9dgKL
         +tye5ZSbS6pwmPHw9D19hD/eYvlBdjhmlcTlEuUtzybEfwkPt3QrYlZ/NEL/6Z0HVZYi
         hblJpEfybJGndiCHtVfEyTgmHCUVVrp5pWTplOE+fzKh2MO65AxfCzdGWl4zzphUhkbB
         nb3A==
X-Gm-Message-State: AOJu0YwoVQhDvorGue4pHxbE/Lvr8oBAuR6LGRpd2c9EWChQUvpynGkw
	c6Gc1zSrwx4IBvW/sXyhH7UJ/br+v1cBtFNNXXZERZx5ItRCcSC068Qe1QnkW5mVxkoQSM8dW3n
	W29Pdp7zF0XNZjXEMN77e5sc1IVhVsgwp4UaunPTY8nJN209CEjfVYpliESuRXbuDKyhl
X-Gm-Gg: AfdE7cmyaDsQVIKj7DFP0FuysobOVmtAEHJ1/bvm5oga7cHuprfV1sZqNLaZi496upT
	ZLgZprDeVUBUPrzxNFjCbVrpQo+h0ALFXOH2+V3CQliKgoQE7tytuvnpLpgjGScyQPIW+FDdNCL
	tJEe6M6c61rLkfJbzNNp+neFdDdJA3YyRr5x/HZQswpZSpZ0DJ6RfYOeNHKGX3tlykM8+XGQh0F
	QSI3guQeb4DMSnXH6AnJJYjOLXEEUdmDeEopyGpd6gwSIP6zoX77ndLKc08CIQwHHVTNtTYsKR7
	NYCY6ygQcGHNchZ4nsbbldQXeZRcXwsjcchRLSJ640hurGKujpkRrvmFvJ/SFhXnCWJ6T0zrGuP
	xOOJgFSsqzJtTmkm1M4k5qYshetFZM9Qo9sE=
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531959185a.0.1782213840076;
        Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531955485a.0.1782213839581;
        Tue, 23 Jun 2026 04:23:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm493667266b.24.2026.06.23.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:58 -0700 (PDT)
Message-ID: <dfc8686a-55ee-466a-a1c7-af069b849e43@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a6cd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KCxn9JDMVLvDjnwYN8EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ym7M1Uhsxz95fPp8udQSos8MBewMIPq_
X-Proofpoint-ORIG-GUID: ym7M1Uhsxz95fPp8udQSos8MBewMIPq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX4Bsn/mkCKoXt
 CBy+PCVlpMNsjFyrNxk/z/sZ8nhRuWBYTBoYoOQqY5yb4A7IOQIjIvDf10txulI2hTfA4jCP3cd
 06E71JIi0BTMyGlm6VstRXtSyzP3iPA5gUdVHbH7EqCE8ZY/dCHazMdzn7rc/teLvdpsIahL3/E
 HCpBSZPsJIUtIAZ+3+r5xFgJGLeQKzTd85RbSfEynu/qkk8klTC1riMbk+67jCEuFvQ7I9rlfs7
 6WwbwDUKJTcU1wv653n6VzB02WrmV9dbe/gjvK9Kj7NPJ1WvuR4OKIgG7WwJcS1QZ2eXvL4v5d5
 v/tMQn/FZV/1Kqx/vmNe7DO8UeJVVSWTj5LItcSbENRamEh0GDXPOOxjEFJTeskTjTN37QWKpZe
 kAurvpoMunr8G+nZGco8PZGzkZJlLviuY/TeY8IrQnJRYWijWKh4jlJtRFhBQhIiyqBY3PSUp48
 a9UEMaYqF+FzKRHRE/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX9X3qsE4kELTU
 nsI1Z1x04FkPoHSwqeBMduhuu/eUyHDEI7i8GTHUDD8ZsWNZxgL5hLeqmW93d4qjvm/nZtdPTA6
 IFBnYirrrkgRtoG16BAJb4q4MiTvm5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114182-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B2C46B6B1C

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it
> can be properly configured by the IOMMU driver.
> 
> Otherwise, there is an unhandled context fault.

"because the framebuffer is already configured in UEFI"

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

