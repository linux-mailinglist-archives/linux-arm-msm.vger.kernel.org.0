Return-Path: <linux-arm-msm+bounces-99834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEZjCbjEw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:19:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1EB323C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 184AC30AD0A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269763A1A41;
	Wed, 25 Mar 2026 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfeRYa7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cH5iswny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8E3009EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436760; cv=none; b=KQatNsHrlIpKFyBgQoBUHMtdhaGGcy1RLdOFoLd3micuWAFI3BfJWPKS/73/O5GmtYIRTEV/TMCiyeK2GqrPtCXZtrXVJ6WfmrA14QcH+AEHdY3NoFYhPIfFO9tJpmok9O9dPHttc/8EG+fi8XLPN8wpxkHiC+5k3Bd82gEqkVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436760; c=relaxed/simple;
	bh=CYuFTJky97e9Z5D+9MZZGO/71Ag5SzEVeTnRCON+oig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9bSRFCHK5DCIAr/RpBm/ttjoClHTOmseg+wcBgFxQjgy4ULC3pLrBR+rDLydCxDKgkrp5unJ1sWJNZcVllVVJuQOR8uzx/816xCRhO5SqWH2qepmEW7TyPWgQ/DI98xrIxnotb/k+TiKEhPJfhoDpxrrUg1GEX8oCNefxd0O1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfeRYa7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cH5iswny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4FHA2931443
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhOAHvMJKevwOrbfD1PhZ51iUKVeUH+vagSnFd3VQJ4=; b=gfeRYa7VdP7/P4xK
	MxN25zDUAj4A9JV15YUBqwtuWj80DCx34jhc0CaOcA9Z/8uJ4xi15fvA+40u777+
	NvlcHKbCahG3G5uNYcwdnOlcNKc2BoWrF8xpNBbo/uluDcWvYn2NxeaE7cxepiOM
	zirtgnSFVAxLmrXeYOyQ/LgKtAlrJHX69gtt8+NNqz4CFBeAjPwMQEstgnYHImWq
	kn3V9nmWg3xeLCqx0stCeOtAUexgjb33ij4OMvLb12bWM2wx46ghA3S0UgP8JQBe
	9cOGxuqxX2WQRIulVDFL+xv6NM5C0aWHzINlP6plvbEgOx/uY1i5b1gjA3C2QEjR
	PZntmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr819-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so596462137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436757; x=1775041557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhOAHvMJKevwOrbfD1PhZ51iUKVeUH+vagSnFd3VQJ4=;
        b=cH5iswnyahBZMriC5MmvkOt1tmvzfZKht//0t2Vgl5+GjqaP/RgwJfHAhtrl5mxw/X
         jgLamPpLZdqsAL4UClUx/Ak0X6bwadnq+ODpBm8SZf3jqcF92/PrLAFgjpSvXvtmExL/
         l7x7eykfiyl/18vgjREINwECyBfKuOtJHXsC7+VGxcJpwnwR8EqNn7cEe1RnmdXhQMcg
         aXKoiSMUZ/OKVfC8xOhHa15pqHHbOVR5ORcQ1Zx6RJqD1ZZPO8ruGjQDctuvQWT1yyXm
         aLDgckui2QuyB+v9M6NJyM4KmgA1nLmn/iobyx3exsBhhFwT0INrESzrX2KZkb3SniV3
         d+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436757; x=1775041557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhOAHvMJKevwOrbfD1PhZ51iUKVeUH+vagSnFd3VQJ4=;
        b=GcmSEZLyw8SKA1uUuzVqrv4mhmvyeuWxGQESkxZ2aPJqAPmkVHwwo1P31WGTuB3L2V
         72/l4Vdb/PSnzbF5vT8OTCl0JygRqIe89kj5oRSDVXYmgzv0strV7OU5V92lchN1C4sc
         d7zllfAzj3C4wghPE9sTGzQ8CapU4dG2Ot/xy1SkwUKkD6BtHViGH8w9ThF/xramZgm5
         BRy2r5yEpYDXMZILGWio5SMZxrLM9wo/RGufDw/mY0efjyLShpjj+2J6Mrt2e76ggX1u
         Kx+yTyIqp3Qaz1Yoh5YMUaeeDmOPhEXligvxDo7+Nsz6vPDMfcvyxd23By3TyZENXCjz
         y1DQ==
X-Gm-Message-State: AOJu0YyvLG8EfkNzyZDOvFwTf0ILqbHB8d3XLUePUjuTsugG9edgIvUG
	bdZ7qZzcMYawq6/WmSGcs7cWicbPOEQ8f+OWyG729ZJjnpqoaZQkqnNCZXnTgiaCPMQ3WKHy8Fl
	sFbp3oPxWXTtuOarFAmwMxxE2GHtFkWMQ2x8Kg920n1yRXkMp/1v4jAsxqXdtAkRtViTA
X-Gm-Gg: ATEYQzxwy2x9Nj5ApVwPHUnDIQr1m7H09J2T1yc+h/hqQGXlAgCkli2Me3W8KgI7Tfb
	5D8fQQ76kEtGitu2uw4rU1hIp2iS5/JLGL5/t1Lr3SYtcnP4arYG2mTomKiDXz0VZh3OUmsDkoo
	Er6/DjAST+hDyKOa5rRYBCRvuEJycHAuPoDZWslun2CYi/f2+TtYA37u8pYyvUg6OZY6TPrMrmw
	4Dz/b5FB/OczfgxzVV3Fk2JGsRXdZAExDBBLe11KJAjB3i8HvCGM3Vlwa9YGyQul1pPhU/gXnuy
	srZmAi1jceUJllL7olNoEAYWhgCMKbm9fy1kusq6QI7IjJjWJnOSh362HLqkDmfXiANd36g2tlr
	aMBcB+LFxNpTwJUdHaNETyAvEVLab+yQcmk4G5uVEomegcbi3LqX7CvhHOrMLVvJVimPekP8oDK
	eg2g0=
X-Received: by 2002:a05:6102:c88:b0:5df:af0f:309b with SMTP id ada2fe7eead31-6038743ab3cmr714898137.5.1774436757352;
        Wed, 25 Mar 2026 04:05:57 -0700 (PDT)
X-Received: by 2002:a05:6102:c88:b0:5df:af0f:309b with SMTP id ada2fe7eead31-6038743ab3cmr714888137.5.1774436756910;
        Wed, 25 Mar 2026 04:05:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm780796066b.34.2026.03.25.04.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:05:55 -0700 (PDT)
Message-ID: <1bcee25a-4dd9-480f-89da-adaba6752bf2@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:05:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] drm/msm/a6xx: Use packed structs for HFI
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-7-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-7-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX/ldwXLoel+0m
 JSA5p6gVSwRy9CmpCcaZubCanzhJkPhSQqarzRDzAM5lcpTNiXUwqsX96d88an3vb4JT/MalMoo
 hnw6CbtOeKg8LZkt56hxLcQNTi6U5dckLT5SG8WEap9tdXiqfBIBjHgqKrPhfTela1Eq+ocXzaF
 JWiC0B3t4fbWgTO8qxDHuz2GU4qv2AdyPrwCmkc9LBAJk0plaxPF/EouulRoP/NaqLwPjipCmf2
 s38T5b9nWSTPxjBtYNR0JS10zcCcPDrxC15W+o/rYWww2bIB70lHYzkzRgk/UUQbUjhFy4uLIQi
 T5YCIUfSf4RVJmxiC6JSV3z0uY8S1nNTEC7NBQCnW0BCA0WKhkL7GWmVGXWf5HzkDBrhvnRn+ur
 dMyjcIf7lH77S1E96CAn7iXtZrDIs83Ei5902GCm/koH4bdnWZLF/nrkqZCeOeanO2Ve6gGo7Lb
 oTFcUJZKOl8hLY7hQGA==
X-Proofpoint-GUID: 9bIDCOeTa1uEBJoeBOpnpdRB_D7kMxr0
X-Proofpoint-ORIG-GUID: 9bIDCOeTa1uEBJoeBOpnpdRB_D7kMxr0
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c196 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tlrG-h-73r_ERHy7KigA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D1EB323C6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> HFI related structs define the ABI between the KMD and the GMU firmware.
> So, use packed structures to avoid unintended compiler inserted padding.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

