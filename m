Return-Path: <linux-arm-msm+bounces-97984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLAmNfQouGnhZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:59:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82C29CE45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E95D3025A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D3B3B8926;
	Mon, 16 Mar 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+AJ40UY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehQb0/+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73CA3B8BB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676469; cv=none; b=J7oWt/8oMZbQIc4vc3lvfFhrUPIGl0VfeVwLcTc7OqXy17Z3ugTIC9Ssz9bnGGQ41I/dZPMfrQuVgXX7sayrZtjRIGFzEhRoTpmfB9Fi3N9cuv1GyX8Hy3BPJ8OYuXeiy1+9ZC2bjeRXkgM/4ilQxWssuHjDYVhr7cjRCQ2W4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676469; c=relaxed/simple;
	bh=fi1UvJHokmz+RJ4Hu7p2za3Q0/JGGVDAf9rQgX42594=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YR2BdfBuz8zWtVwN5vpnAHdZRi/6RSEE6oQOWUvLob83c65ncRMsNt0HixDK7EJ2bWNeYIkgr1mB/qrUjEyizJovIqhGNPil+od4+hlGQ/eDBDxQnCNWrkOyiAmntbW1iPb/GncYKUJpUElAWARv3kMGw7d+F5CdS4gZnXkZuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+AJ40UY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehQb0/+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCXB2G1622327
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/COzsdywY0GIe3CITGOxD9FEYRD8mRYrXXlCNn+OzYs=; b=i+AJ40UYJCWI6Mbf
	HWfBwGPr0dDQhuISQO2SkthgtJ73WeVecQVz2cncSLdKA7m0yvoZ5XRuEFuoK8t6
	BrcseL1lO1GvZGia8o3bxlFNzWZ0liaEBZJnmdIyFADPCpTseQoKYKmmSmeTEpLj
	R4V3oa/Hrce8PUbXZmQKhv+OvPSyg2ll0twOGcIsbhrv0/C7Zc+D6ADukI5yUH2Q
	aUjS0BFxrAt1i7rTZYT+njpWLqM3Oh0fuBoqmQAGA9N9BhP4V66nrnbtui02DCJB
	o4TcW1GkLbrAx31IWLnhpI2xTJne1WCks9WNReAF6qbCzPTTz6bO9Vae8C554VgP
	lBhPzg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyegs8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:54:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a5b38affdso34973576d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773676461; x=1774281261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/COzsdywY0GIe3CITGOxD9FEYRD8mRYrXXlCNn+OzYs=;
        b=ehQb0/+rSBpgQT/lRB+w1JqIfLdJQAAvnWVOcnUSNEgq/3uL2D1Jf9ZQjEx3AV9j7W
         Fl72YQ97id9Pmv0UfYGhaRK3LswTI6r1MHygYx5joIvUFkZdu3FdBWE6ZWQGxUzPJTHM
         KylbGPbnnW0NbHp+nho+Kh8lay0CCh8iAgDQlWtBCrkZ9Jc1Uss64nFgwFTOIBCu/K4P
         8+1/QG+IY74oF0DntCIUhT8r7kFryVo9XDraHhr+g5Cli2KgxNJcRxC3Cg6jGDlsC9Ym
         h9qaQYJIhpmK7rA2Px1231Iz1vk7LXTItjsOSHFENnyAedQLhc/LnyvtZAduN1mZnj8a
         mmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676461; x=1774281261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/COzsdywY0GIe3CITGOxD9FEYRD8mRYrXXlCNn+OzYs=;
        b=Gy6YgMY7+x0O3Wh2zWcdtXzijpyLjwXK4tD8JiHSFoiyga6rvHXJ2MYQozgQGLTwev
         WgeO89N5qTkUwwuGCR6lfPdKIn4XwW/OtMlOF4pAVkw/OKiEwc7/TNqZyMTroa5uL6oJ
         Owbs1QxyZnNX1TqNklhkHpiFc4iCNRLlMZRDIc9q425UqB/RSTtVV1Khvt2DAauXmGAF
         FINIZ0ggw3aiEL+YoOdLZXXlb9U8bj+TKHMWcUysuOMRAd4Uu7iK1EYJnyxwy/RvVKCk
         bMWhcuN3k4nGBCS/BMcM59ntkgpyTV2pLDN2fac5EjGYbrVnebli9Ms3YOrc1YZ+yChp
         AH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxD1H3vg50w3qWJ4IwQBsaZ/swork/2dcYJpJuFoWSi/7kO9B8Injm2I0M+Pj3eQbqGaBNBX/EEj7Z54QW@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqU+21++wlUzcmdWWfPwpyJbuNdpKworqNAWnFd+fNq2CLdu0
	ebOsKYQI6ChgqiksfP1laV28mWKLvAAcGj3GP1jKiVx2ZEu3z4bDt/RJ2X0gZLWlhbd7LT1qIyU
	wJYsO37fMYgpa//7mA2LFXkU0a6DApIufUJ8dVk4EoHSKAmuE4U28s3bvDXmwyFL7M36y
X-Gm-Gg: ATEYQzzCNeLb+cVj0kPygYXZntnIBzgkEwe5/LyBE3qmPUKDTC1Vv8Gpkpnh5RX05kM
	pEJ4D4oT1E9W3Yq+j4f/Tat6ePSYjF2mbBi2/AH5PpGDgzDZ9BiexfNjzmZbPmWtFSFb6d/RfBz
	jDYQrKRV8hLxONLeJw53JsLaJhuUoX+iQOjJRB29Dv1DXltfzl+fxHFawY0gogqM5DGmc9VeF3N
	jEZBNYmqgqmCniWCPnyWjTThpkAvvSQA0fg/SkBek4ExbVJsnY0VCJ91RYYIlMNBdb/7xZqrTsR
	2dU7LVpqoNdVXMVW5ODokJ2cjln2XvTirwJ2L1Nh7BrdkjTXYkiwsL+lDFy/I3MpEcspIVf+K82
	Jbn9hhmEoLGdNstoU2S1iCaR7pa26MBinkbW+/h7CCbMgZGgj3iYn8wC/il84NSf6vnvBDg3Uw4
	4ynww=
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr136320646d6.6.1773676461583;
        Mon, 16 Mar 2026 08:54:21 -0700 (PDT)
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr136320416d6.6.1773676461052;
        Mon, 16 Mar 2026 08:54:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc1a1b6sm559320066b.23.2026.03.16.08.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:54:19 -0700 (PDT)
Message-ID: <b87dadfc-f485-4d60-abe6-eb3df69b4cb8@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:54:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Add QCS8300 to cpufreq-dt-platdev blocklist
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>, viresh.kumar@linaro.org,
        rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        umang.chheda@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
References: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KmBYENzyUZmHC-gSLnaf7baJf_P7c4Gb
X-Proofpoint-ORIG-GUID: KmBYENzyUZmHC-gSLnaf7baJf_P7c4Gb
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b827ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EjsFmGMMBDiEkl5pk6MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEyMCBTYWx0ZWRfX2zn8cAZcFAmu
 xEvq4uO12DQyMtQUxnWIhVyGgCx2u+cXs58xBPoQ1KXIq1ZbE0SZP5eTA/qT2VuIa11V4u5oV99
 ZEe2PbABHVcWpReRedeKqDT6TARX75hEJ6kDtAwokGEenAguWe72tmCgCglaDAyu/E2lWLEeVpL
 uHJSmEx0a+q5DQHN4Qm8fUWdBRZtzWzgb9Jbxkjg0QznavvdVfDaznlwGT0DvkHATLyzrnDw1Jb
 s/OBt5IKf+7vg7NUAtjl87bznMoEPWCHdK2v5ZY8hlh68pJES6jbvDlGYwtOgYj6wlYQgjYI59e
 VyC7pcDApnSw1qHBapHaxNPwbuvH3m1kqB6D8uhrm+fAjPLelD5D8hekPBnagiTgIdZcKfbmFzF
 p3KNkXOntCyO+qHnm88PsPRF609bPqmzUs64EWO5AzR9k8AL/jhaTidzXsTyxFf7Tc7tTTFVpSK
 QG4NK4U6SM2E+Etx/9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97984-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F82C29CE45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 11:37 AM, Faruque Ansari wrote:
> The Qualcomm QCS8300 platform uses the qcom-cpufreq-hw
> driver, so add it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

