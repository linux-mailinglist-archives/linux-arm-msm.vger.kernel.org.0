Return-Path: <linux-arm-msm+bounces-97405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD3vGInls2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:23:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D339528160F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89E353087FFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678B5390207;
	Fri, 13 Mar 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnMAHNbQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+vbUQuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B88390999
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397335; cv=none; b=UpGSBWnGvEnl0ZZjVp1BotG19pg4+qWcn3s7VrtX0HKLlGw14rhvv+UzjAFaxiHsP1eaqH4VAefr8oHuYvEn5EIU3f+4CCzKXdMXb5KdOHR9XbyIVxj0YS8ZkHQ7HC+6AXr8pj8H4z9yi0fz0ymopXcQoX+6C63kQ4+HU2NtTAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397335; c=relaxed/simple;
	bh=xlcynSd5M77rqxmDv4/Hb/HcRNlxaO/ctOBPe2PuYu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM2jZca5z7TveCRii2ZaNDkX3BH9u7FQNDjPOKpaiz86i5H6Pww419pLgTsufmuC0peoHxXyg4JkGv1fLVg00mJHoojo7hBh2Y2KtCW3TVL/1b7XDm26pwDaTAPa4X0LLmIe8i8pjcVPPS8Rj3ivo8SkbUBsC7JxckqJglICFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnMAHNbQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+vbUQuW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tmWW3844417
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RLzBru1PJO/xbKYewzMwJUh7vtg3J9W4Mz3Jhv2beA=; b=YnMAHNbQYPlu6xTX
	f45SZMUf4QMkso+YRyd6pprSEk8AeUxxh7FS4JyoNyewUfWh97e83XL5xH0WomI0
	OPfRB9ZaUh9aPgMz8hrqNbycNAgihzudZP+7VYPz1FPgTDWicwll7B3NaP/tobJG
	XBsSWIDdB3oqryX/14NPJeZPMDlMjqy8Y+b9ZPdMqbrUyEyaYUTDM6VHLQ0zMKJ3
	IdHaNCF+and6iAAqxCUwhtFWpxf1EGiNTPpML2iI2+vZ3LlcS91iB3lN9lo4/hMf
	rg6Fw9h0SrE7zc4vBkuc0MNe4/lQBpUyzwVkDWnt6iLHia9wVKTDrCdkOuE5y1OL
	QPJc8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54wk8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:22:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90210336so87868185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397328; x=1774002128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RLzBru1PJO/xbKYewzMwJUh7vtg3J9W4Mz3Jhv2beA=;
        b=c+vbUQuWQTQcKuDkh55TquLcn3i6iQDFZRKvaMIu+Io4GByFMrXVVAZ9R7i5qPqakc
         UFAqsmSNfBvp8vWD+YoxV8+bz+QWcF53EXhzk4pPBVo0ZU6p/AYhSBYFyhYdL/ZAe1k8
         a3YASm6YNKAhzZDMpwNzAE+OTQus0nfFxFAk4lZQhblPosuwjDEiFCmkRQ1Ro/VlYVov
         rJwV/2Qdn0jxL4xAgGgun9XyfSj32CevW07VKWYpQ4lTbNGKlj/j9/ZI6wXg0FgYxPgY
         O3+xiUOE3HIbKGsfyIJlilJTAHNWO1dVHmbxFTt66Zuf8u21nQO4ig/KMMcksEWrGpSm
         m8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397328; x=1774002128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RLzBru1PJO/xbKYewzMwJUh7vtg3J9W4Mz3Jhv2beA=;
        b=cq1xdv1U1xNn8uojUbB28oiTIbvKxh1RS2fGGzVeZi7GaHTeAfIQv9eT3z3d4m5tSl
         pnkh+7YR7TG6nezNRb6BANFbDFa+i3EfEg8YbJyzTSNfAfdEcrfUswzE6E4dQan0mZyv
         hZuXFilsxkfG6fXE8K2DpeW1OYlWHYRczYSErEKhLMVuWAmct9kAvY8RAbNu1BOlAjfR
         QvBTd84Vivol5hNxqqWgmd15N+f6p5O9iCHXaoiesW69FwsvqT3IYP2e+dPTyCS6KMf6
         tKqti72CkNVVNbjL25Da78djJJ4YuqmrhO09o/IZdQR5Slc0crCWG3mrSPp8QmvQmFtg
         33Ew==
X-Gm-Message-State: AOJu0YzALQAcCxZZs7xpnHZRgkBTUW7EY5/e70Qqps5yG/Gjj8DJeqdJ
	gNGHzDemfKH6SuxwUM0Dc9NXmSaWcz9XZBEshyLWBfHOHAsWlwUm3OVgJ3zsl9h0rJHC6sVAwlA
	CGffKTH4sDaXGMMYbKewhAbfcwINpsSobKUL4xeZRUUvjkAnT81U2VyXpuebaFjkEcy6g
X-Gm-Gg: ATEYQzzCemLa5XG56WgtrVDKevIoQZjsedtzwQXzh9JcMEb72FAlvhFtal2xV1SuSSv
	iFDM2oN2qveN74s8JxV/9vdY4UzHNpcrvEI9SS1IyARWTsYgRtRVaKYpZnxDn66bv0Z+htLE9ea
	iUQP15VUD6ra19G0UFSITpZnox3RrGnDy00IbqeuoLJUNU3G57r6MaJ1F+H8rXkt+MX7o2Owsb/
	+7Xf4s33FyRp8KBfjNHZClXgvfX2KgEQ6K0DsX3wdp+ZwieB+70muk52CeJuEx4kE7XShopuABN
	bYeaiCAvgWKSzPBT0S2y8EE1kyIBX4h5xUy8LomGiiuCS3qhI1tGZMLEDs9R7cLnATNb8PtzIOY
	7bnYdqhqWkNc9NgCBt8fwYv9kA8rZ6h+iv49Na7YkbvbYbrX38g2ka/dAbfCJPb7E9c0ZNqzKme
	LAi94=
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr274207285a.1.1773397328095;
        Fri, 13 Mar 2026 03:22:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr274205585a.1.1773397327672;
        Fri, 13 Mar 2026 03:22:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6635088ffadsm1220549a12.21.2026.03.13.03.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:22:06 -0700 (PDT)
Message-ID: <f16d0ab2-dc40-40c9-bc1a-772efffb71a0@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:22:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: drop ubwc_dec_version
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-18-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-18-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uF8OrL8h55rnPMhi27gGu0dQm9S3AB87
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3e550 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tWrNggSR6SyvBOkGGPYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uF8OrL8h55rnPMhi27gGu0dQm9S3AB87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MCBTYWx0ZWRfX5I+hOpeVJebL
 lzPGL/lL9tzKvUVSoCDmBEGL5hsWo4mD0O+5YDC7dSmOTd//OTCd1UqhPVWUWL13DrRGhuH82TP
 Lf6/7lrlhph3fNm9cT0b3/bJA9/ebqpwBY/zuRB+Qjjw6tiE6ZAjJlzPTbFfPbob5F7+OqH3dmm
 yk34qPkeO4JyL7QL7KfANP6KbpvSGkccI0aFgMSD7nrp8eKh7r9GnmTNHGC365xs1VX8Z0V5w3j
 JffDfPdueRnvs9/sTp2aTwYeNgVLui2q4iP4G2SUEcrjfyI0bFF10gmOcEymivWofwTN1px2kBe
 FeKglSjHPMrInnh1PeUdMXoNpFUuTQR9DaL+RBaAs0f+/zZUsT/F5joaWwT6yruIAaLeBZklfSk
 zzOFIt1BJ8ditttqXlpAUYXXVg3TEsSK0iyB0u8XjDtUeMiXzS5o2ZDSxr8q1op38zOs7n5oARx
 9eEzQruA7ldaUtr+7MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97405-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D339528160F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> Stop using ubwc_dec_version (the version of the UBWC block in the
> display subsystem) for detecting the enablement of the UBWC. Use only
> ubwc_enc_version, the version of the UBWC which we are setting up for.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 547d084f2944..f424be5ad82b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>  		uint32_t format, uint64_t modifier)
>  {
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
> -			   (dpu_kms->mdss->ubwc_dec_version == 0);
> +	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

