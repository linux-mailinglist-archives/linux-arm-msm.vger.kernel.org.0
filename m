Return-Path: <linux-arm-msm+bounces-106282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCjMMOxG/GkkNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDD4E46DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D3503019F1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D79E322B7B;
	Thu,  7 May 2026 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtAcGAxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0hd9R8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D10331A63
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140900; cv=none; b=I4QPPlhHiEaHpmcjq1sWRrrSTNdP1pC6UPrAA5+eWRSwx+d3muA/N0e+i+aEEIl6ULXqDAF59Gt0PDjryuX+KkUyKzBye46QYh/JQZF4FSevLHJNREcj1WICkMya4mqBVvUe4+fg6NSjaPt3dltBETJ2bYWABJ2zsL3c/VXX/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140900; c=relaxed/simple;
	bh=5Rtl6v6NNbV1X+gpoGuS99EbUlh7f4FwWbPb3hKL8hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjnPZmn14gj/+EfYYSHoVSjE7ZckU70QoxizUYFFkfYKrSxPcJz2BFEZc7ftTjtXxCMwhmvLyb1GC2e8lYm8ub5m75i/7+CDXuKInhgvs4tPIOefpy03X3m6On7IgEdN19NTQvqRUncYNno087hIwahefxR2Pn4Btz7udgAneBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtAcGAxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0hd9R8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M8t93156931
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=; b=dtAcGAxI1vJxeRPX
	xdcs5EM7jPWFyZvW+Hr0iwmUJxqUNG9SNLnR0Ebsb2fVZ4R6AXcMa2x/Aet4yPgj
	irD88uGLXCIlWzvIm7SnCGwrdGrnXkOSL2LTkxalHlD+oGcqml5ejj2AX7QE63nn
	LDbrszYQeoSMY0JlEM1OgjRJGbmo1wmt/hqtj7/AypvRckjpUHGfiAsALQeUJzM6
	7Aw5ehk3+OSKjAy4eZn06Z6xlWEE0jfiCluuAxDGPDv1huzqh0Sh3mAJrCQAQf/D
	iiJ48JEyXd5TGWDIY/hXEmN7uL/RuWsK+i66tGG0DOYinHAiBCsSfIH7yER4XL+V
	Fri15A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf0jdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:01:36 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so67964e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140896; x=1778745696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=T0hd9R8uqmuMvEOKsC2bNuOa48YDg2+KcJYN1UFPerHpeY2ANgOv4ZlaqYJ7+ZxgyA
         uJQ6yq0dmKt6c3/6lkw+RqvA3VnRclTdpUcBEKuT1CCekSIHSWJS+Y0YJGRRxWa1IDYh
         DPMPTm0c42g86IWtsNfCeeIJhfH8C/zVplk54GJidNjftkHE5WrzwVIbeF7oaiYD4e85
         t9E24vx96cYVGsW+jtelQv6Ev7h6Sdqs59P6G5A4tXTdhD75Jz7tr0CTD9kMJbZcfUYA
         UBf86sqzWXoFA5WscMNMFwHSsDFA1FTeBkT8ruMwiDcQqICjMESxuIUsdt/TECdzLD6w
         yOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140896; x=1778745696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=X1QpYidFH38w8sn5AOSyG8zyoZWDdyEuAfXKwJXnlk0TR5h5R0v89kCLK/ohd8bW2S
         lfpnC1H3egHIi17kl3EqDfQ0D5RztpfgPDUd1sz4q25OqGpBapKp1HXV0MXJxWgEHush
         AEWaezrYy48s4ep8sOPPVc18R1BGSPkIUF2XH/Iw/EmH5UHJ+Hof4vZL8WDgGvx4gljZ
         KTG+Fhqncn0ar6cJiUOWq1l4F+R3hohtcQUH6FkuGlm6sk3KmYtrM1wvMejQ3bxNh2kw
         XjPyBhSPUM+R2fn0ZZE6zP4LQJj5lXEJyoDsBbHDD38uE5s+1boVA4x3O+NoxX7i3G6t
         HUSA==
X-Gm-Message-State: AOJu0YyY2uMkNAByTF0lM4O1bTKxcOkf+dKdr4FuQ7wuZf12f7v6jrPX
	yn4OjMYv+i0HzErlOgol0+rNLuUPhjmdGRuUgITsEY8e7EvEQY8OIWZ29XPWodboMzjkTnmIBXy
	u0dpV+NJYByvkTeit4TKbfyLi6j2YDo8mX1pG063FTmuX+wVLjYVfm10Dj8uRf/ka0BJr
X-Gm-Gg: AeBDiesh/pdMHcC0MldHQs2H7qS5FyWtTrsFiJBs2kG29XPHYCLKPEJWLSnCZwwT54Y
	67uRaoXKC5pDjvhx0D0GQpx5lLnKowTGtBMRtOA0qti/qqLntUWMID2E3YhPWo0u4riPTR0gIZv
	aUt+9qIFtImVrTT/PJzJ+CEDyPp4dahF8DIzA94MlTi+Me+vIj53qq6cMEXIuNInc3Gkrsxr4vc
	ZsCnhqDxf3FU/dcZ5n+8iCPIKVRte/rlE43mY9tvibX/yBJpU3Md5aDrToqTcdGo7Q4EsnOof8M
	ZI2/wJfCMG+Q/YpkpKOcBU4Rvlmby3eYLuxP4l8XK7XKvBvdVc6/FnQxG5655dXkhtzuYpMaRJb
	N1JwIa43U1tPm3e235aFBRWEPyzEzWgh36B47FQ2WvAsUV0SBqoVN3vaSyVGcMcJee9mf/+Gum5
	6p9w4Hr+uRm5SuYw==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182884e0c.1.1778140896045;
        Thu, 07 May 2026 01:01:36 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182854e0c.1.1778140895636;
        Thu, 07 May 2026 01:01:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833742c49sm52804266b.30.2026.05.07.01.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:01:34 -0700 (PDT)
Message-ID: <9545da0b-d6b7-4298-b86b-f981908c80f2@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX7Ugo/D5g81rX
 FBonZkEtKNGeKF0qrpKTnRq3HfH06LG3EAdUiSambp1GtvgObC30qTpz0nZ3CxYg4npxrBWVmvz
 YFJidanb7+HA/FYhES9xir3YtaIeg+HtSejVgN1x+R6gqS2oNTR/5reGHJ5PKBHuPnZjcNwe2NU
 Pu6hdHQJVrRFH3ZSLJHKVryVYM9yqojwKeyBuvs/9dI4S9Er2GQk2uSzcg9nXgtcYRbkZqH3Tbs
 eQObq3Y5yfhKxNPyeM7NyCXzr2wovoHKGePwbnHLtduL2EaT3FZmbTNf4CkY04mOcpjoEIxFAXk
 OtP1FjjnPEL4q773gqpU7x76UEEYrcQhSBvidF+gaCrsBANlFEhNJRAUCUjYLy5scD2QNj2g33T
 /8mMRz0n1XicPFimBcxxA8JUz1/xgrz9iFFs5QCJ1Hrdr/lcrhWNxCbGH51ol/PvaxOqHYjtIaW
 vWJqXmJ23y3AUTkSbyQ==
X-Proofpoint-ORIG-GUID: HIrIWE8eL0xN2BU9KKZo0GD6AdPDqM-0
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc46e0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: HIrIWE8eL0xN2BU9KKZo0GD6AdPDqM-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078
X-Rspamd-Queue-Id: 64CDD4E46DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106282-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

