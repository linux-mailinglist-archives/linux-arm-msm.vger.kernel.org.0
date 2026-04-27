Return-Path: <linux-arm-msm+bounces-104737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIBQIpZh72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:16:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E43374733DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C2253031CE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209B13C063E;
	Mon, 27 Apr 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/1r81SI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ogk1Uly3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D8309DDF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295621; cv=none; b=apDcRwNoJZ9etyd7C5XHTBNZJpOjBXYBWRutv9+9/GtezxiFnD3kVscHorijbnUhU8dZTAficSvHq9wsHk4wchApPvqKTfTXJpybKNZEpdSWxGz9jgTEumxK8KfUKrA4N6pri8bCCR9EUj1Wpnf7rRQEUHC1AO59JcYTjQJPGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295621; c=relaxed/simple;
	bh=KezrkNw/+lmUoQNie1EY/ZMHhVdnXfaPf2VEJ9cEo/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYKeslHT+x375HccWGl95RwZ6QRZkG97dt1zfgu15DFCek0PhYxXV7yWy+GXyBcmN+ePMApUhhigHfOFvVCZLdNHrd3WsCYbSeUuYDW69ZeNDSLm09e50n33ujtqewy9FL2yGxvJqA8IU2bYOFwQ7hddQSYrvKvx7u7p+UTI+BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/1r81SI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ogk1Uly3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OrvP3825535
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=; b=Q/1r81SIHBKGczY8
	zdRb4t6sOXXPx3fNhFO2/xgtH1U9uCWmcvLC3IcJ0JRWHo+jsF5pLJANwhJ/6Pp0
	hUZIvOcQCkWXj+ILELYT51emAlIZXTr/aBByLFxr92ay/pQHAXAGzhdnepSSkx8G
	fpUO/RAT6+V94Odn0prXVJtlp8mdyMZKk0UUkA/QU6mwK/Hzn/noCAklCvLzNAUe
	S23Zz4sc+KeQhREQ863iVVSl1dh0lk2G/s1JfCqF6f9aOb+gN8NxVtZ0mcymyWnF
	BkYIJOMTqVBFGHAISfEiYNCY79CLFN4oFL7HAFzlPyTU3boygqN7wtGmCrUXlI2T
	zRgUIA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550uv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:13:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eec094291so647518e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295618; x=1777900418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=;
        b=Ogk1Uly3JaiC5b2InrqvkANznJ6vHGQaOt6qp7Ll6CRd4qDrudIHzaZvOQqmsrfJfM
         098DpbXx++Bt6IZFB6vvN3Tb3d0ggq9NuCMpSvxhFasXmYdaYQARZ1Ty9qCclMSamSzQ
         9kqkVHl4CWIQOuCWz25/N3MYY9gJgwQKJgaglP+VSuJFrP3SA2j/y+/UdYrnUd97moNn
         hMKBvAI1RHH929H85jCDJA17gIOuM1ltYy/KNY/yCVP74xfMwJ+IKaU8529a+wjj16r0
         fCTJkSvuf5beGnkYqBTnIk6o75TXjkJaXbBu/85tG+ic52OprVRpu9p1Qxcjv9jVVJsA
         y+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295618; x=1777900418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3iVNUw12SY/X8URiLbb1cnOLSTbe21tBccpKnto7BQ=;
        b=BKmocgIhTPJ3kq1XOulqg5gk+HvZIdhrrl+/V0It9V+BktTqspzfDzkrjMWCvMi6cF
         980T00G9Oroq/639T8G1ITqFAW0OXW/7KWyZUYouFh97xswhfEwT6DbKctGLUS2qLqG9
         UbMLhWWN8wcaFJ6dBow/yOIopntvYjg56APbnJZNYllHg4ABW/rPujXYRTkcGH9pwNfD
         aM43RkTqu5wHy7kk4+HjDYRD/zjw+V4Czr1iSt/ncXLdLSZvK+XJaiYL8+++bLZvd8Bo
         k/K+T7PPCSWn14j1lUQqXQ55JW/BE6H1eiyafWONsraB2/2xMUfR9/wpWY4cP8sEmDno
         CGPg==
X-Forwarded-Encrypted: i=1; AFNElJ/RVRaJM+TQoXXF9JJZGr/TfwberxChdU//Yn0XpyeAElBacC/TmzWS00IVDuHDqkzyzf0O8gAZy/gR5cWY@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2uoCGgINMmjLKZcHk0Dqak/4BKfpYHqsrjLMnizkVIZIrnSO
	UUy8t7l9M4zsWOqa2GitTODarCGH7ed0EFZ8bNOnfDOgu9jPEMqsSzFM5VhPGRGXF1uwS7fADsx
	nLTabMzNWBq+R9rT8eavhpOziYt43L+qgumf4LG8fzlVRPJdG/jgPHdgri5ofW+V7yqM9
X-Gm-Gg: AeBDieshsOiBJffMI9RoehFQ4ZIS4R/te4u+SELcOGP0cl6/S+2jJBmBbADTF61MIpL
	rS/XHsk6DtxX4Hh69gJtckeR2u4GRSceGVgMYdi08XvYxCdWD1OsnnweTcB3jCkWj7Gzk+zhn9Q
	Uuoxr1USwc2qd6gczd+OWhbtMDS2aSD3urIpLBtyaCE3dkOEpVT8oxUOup14jdilrQSXfCPa3nI
	XkMaQkWRIGY5/z6TPIAQ8jUnFIzHOYEPwaDM7dZ1sWDWf5BdHX/iLW/FE36fJjXgCdOD9z9VFTf
	jJbsRI9Q4dUvUh/CkkC1dme5RZu/VjGt7OBsaA9KhHzudKCEojxrpucqriZyaO9onWwAJkWF8ca
	vH4bV3pwKdLBw9+vIHrXKV5NNQL5snRpvkMkbqU9AjWir71QUX0+Efk66jXMKLCimfFx9p+h02T
	mwQl/rlhmcPJXANA==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8143755137.2.1777295618070;
        Mon, 27 Apr 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8143744137.2.1777295617483;
        Mon, 27 Apr 2026 06:13:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm1140081466b.16.2026.04.27.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:13:36 -0700 (PDT)
Message-ID: <b8cdcf95-7fb0-4d53-82fa-c7d1e986af92@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: gdsc: Add custom disable callback for
 GX GDSC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-1-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-1-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VbiMnqOXUoZXG5Nb_KbEytrp-wn0MNH7
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef6103 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aB4qEwVHbqlS5mOuu88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MCBTYWx0ZWRfX3qieiWAuUpke
 EUCVsHOFTcvoqT8R96e5tJKc02viexnKQnHQzrlTaYG9XuJoC5UoKmYSGKwvesjmSXNYCc0Xrha
 R2zHdkpuPlKhX8irSDQ7HyngPNTauT5k3z+eFQ0ODu1PYp83fGcnb3xakrdZ4o9UIV7rFbGWz9V
 7ncflj8HQ18ILv0p7s7ex+M1gwH5amB4SKw5hMrbAubPghCJxe4rlXuAFnLJgXdKWrtMQCmYKkW
 nCE6Jba+czALu09nG1r3WT4Jo6ummr/EUWpGkmPpnIOe5fKpLJpWYaPtllGddddOwGQJOhOWTl3
 iGACggS10MBgjVY0diXuOf2xGAwh0vHU3z8ff8jQyYfi+mom+uQFDxD5OC1W2174h1UPVVs0Jxf
 NOHf0iHrfb+HZCWIV2GSvW8FBicVNZHJBxrgquQTgdFESQmwFDdudSAcllfu8pmdK8pkgwQlNpK
 N1u4KblWhknrjLeR8tQ==
X-Proofpoint-ORIG-GUID: VbiMnqOXUoZXG5Nb_KbEytrp-wn0MNH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270140
X-Rspamd-Queue-Id: E43374733DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104737-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 8:38 AM, Taniya Das wrote:
> From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> The GX GDSC is a special power domain that should only be disabled
> by OS during GMU recovery. In all other scenarios, the GMU firmware
> is responsible for handling its disable sequence, and OS must not
> interfere.
> 
> During the resume_noirq() phase of system resume, the GenPD framework
> enables all power domains and later disables them in the complete()
> phase if there are no active votes from OS. This behavior can
> incorrectly disable the GX GDSC while the GMU firmware is still using
> it.
> 
> To prevent this, implement a custom disable callback for GX GDSC that
> relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
> only during recovery, allowing OS to explicitly disable GX GDSC in
> hardware in that case. In all other situations, the disable callback
> will avoid touching GX GDSC hardware.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

