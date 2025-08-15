Return-Path: <linux-arm-msm+bounces-69418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84154B2883E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 00:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE77B1CC7682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DDE2040B6;
	Fri, 15 Aug 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOhzRUtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0081A9B58
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755296163; cv=none; b=Fd+9iUiOCtqi63t21ouVHaQrN3xxpVGehiO9dJOiRQq+n31pwWdLH7J6qhNlfRBRMrpqL8fIWhvWr0m/rJQvS/ScZPjPZ0IY+xDjh90JE35A9WKHBJ5VAVYlqg45w0DxA9pyo9AZJQA6aY8muUdr0FKTR6cw1ncSG/fRXpPGeGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755296163; c=relaxed/simple;
	bh=VjNgzyTx4sXMngUidRb0ra9dIFzC73v82cu4iJJr2o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toFtZz+KqpZlBmiF9l/dBdQ+Z5+CKVf4x1nsiCdVh//DR7KkgatXDt+dAZMqtbPQKcW+dnWacHPTUtHAetvQgfGEIp1xVtbQjooLE0SK2cAyHFRknhbG79pS66AIE4rFyVvwNV80+LiWNXXHWrfO3UWXxv3iNHxNZQFXw6gK1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOhzRUtl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJQj7027727
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	631U00JIllQ5tGvCHGj0/QsARpjFKQvULVL11clEJhU=; b=lOhzRUtlVpiuF5Lj
	Xoc4WEktY2rI/DiKazbdoFtRso9wMfABqnORdUvwqR/9oUoAeUopTVtWFIXGF4D/
	O0IGZUGV8yBJ7bATJitdNMHASgFmytur6+QBzDClIcH15o3pC2WL59axLmWzIwZg
	CypSH/xuI03Uo8RSYFjQGoXvWW3juRRpqLNABODkwB0JwoyQXglNRhwLysg82reb
	NVdNKM7fsTQIiJ0nGb9OoEX3MFBNENcNpjnhEw+IJXextFuDlF1HYHJw2xw5Uesv
	LG9K/G7gWKD3cCwvzCRkLYDNtidJRNaX6q3d9o0Htn0QYo8rXJV2faXGQdgKyakp
	+VzPfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t4hty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:16:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88daeb18so51700826d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755296160; x=1755900960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=631U00JIllQ5tGvCHGj0/QsARpjFKQvULVL11clEJhU=;
        b=FEESgumqU7ft/P9HnNRhUQRtUgNveEICGGidNI1CBM9DuxcSWCAJUMFISoRkG3PpM4
         /cN6CEeswN4bE9NnY3UfGeUrbbug/Veilj5OV0ZSlwgrV/BOOiNei1urhfbuqCphLCIl
         t2aZK6MSkZf6O5N7kfY1s0uYwE4gxXGBm+l27fDmvDvW+rj7HrnC5drVTalH9DkmhrMa
         MkhERWu2v/xUA899ETXgtph0FpTjyN/TXTplPDSef9oys34YmtCbLayNPh0n2HQrHlFw
         zcjTfcv+38ymmZlFh6IyABXmHe1DcDwg0VKHmywj2c3CJLZEkBxWu7lsjoW/XaeMJqu3
         zZOA==
X-Forwarded-Encrypted: i=1; AJvYcCX/AXfnPJG5fdxe8/Q2AmvZ6LVwShh2O2I2gHMWEJx/GVBNmPMqUDdahQMIbHnQMmna9i3Q0ZFfW/NFhvkX@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNJRZx6hXVbK6c8rO9/EMzixjqFJs+8lie7o3rjEvm6eN+C1U
	0ieRY+GmmZ+GmkuhdaV6QwPAqgkYI4pl4cSy5ijj6WwF4XzRABlll9ZP/De+0kQro/kml0TmCAw
	EmT4bhpdLfVVurQ5/Nuznn3ldWKNpmmnJLm5tXPr6rZcis8Cg/DlIAqQ8cmbmzUaLXgcL
X-Gm-Gg: ASbGncuPgDjMFjxvT+/F4QTKJf8hki7sFO34gBpGgpmyT6gxiE7Q4bQjSGWBQUH+hKu
	JGqw9wM7xZANCRy+YzuL+y3gh+ef5bhOU5FRzvpCQ56meLy/thyKaArMzWdFJ9/mG6J8KKjLKd8
	QLHsL855fT6euxjB4kDc9PNGWACSf4fPuRDaJht1KZRSPB3HyU3A3yNNHqnYkIyOR/SpC4fhkFM
	TQRgY1DaGsTH0V5u+l9TsQgzbiGRqt9mmn+FbTSnoDhwPs2YoDzQgWAxvqXdrPSdzs8FX8axITP
	LOGKL5jA3Dcns8yIVnrrXlzHFyQgrPM12aEl0IqZyPRHPLHRoXbn0DHWQhWGRBImaHMpLziRis7
	lfKJudXlzUgYNDQiVnW4Rigwm1PtwqfM1zSlgx5cogn9UM5gE7g1n
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id 6a1803df08f44-70ba7cfedd2mr44628506d6.48.1755296160174;
        Fri, 15 Aug 2025 15:16:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJMmfksOfygkgd6BN8yhIeutfrsC40sqsqYSP9NrdOwrkUMB8qKqtZAlu4lefpDgV7C9ShxA==
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id 6a1803df08f44-70ba7cfedd2mr44628226d6.48.1755296159725;
        Fri, 15 Aug 2025 15:15:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef414e07sm502689e87.139.2025.08.15.15.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:15:58 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:15:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting
 for x1e80100 GPU
Message-ID: <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689fb1a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=uIWJvtJjTPQsrjMnxW8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jML7Q9SdyI6AHUQ4VUGiR_07jDa6a1il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXynB84XEXBJnK
 8Alod+//SR+nJ83zLvq8EQArNmsxRYjzHafY1PhodHgF8yD4Kmh3maC9c3M1bt86jQ5auK7NsZN
 fPvEcxYzcBthzkZDLW6iz+SPM8LG3gksQ9iAr87bqDCftnPgIFvvdVHC/sICBq1aPareJIIiVIB
 QkOqcgIUQ1NqiecVbthtfvQUR9QkbV4eP+sesMQL+lfhbyai5XDd6w1sZl8qF9K8vmW7ZXDX7Rk
 ZXNW74Wn7X6oZnXmwmWuMtVZQdUQLqWSBZ/Rpw7d2Go8EQevCOc47aWYu/VnlVxM40wdbw9Fwbc
 KXojdR07DDpF9ekqO7ltlryG9hfidfNMV5OErFd4Ds9g5PgfcZaVhTCUjEm3xew1Qw2+pvCDW2m
 kHo/QQJ2
X-Proofpoint-GUID: jML7Q9SdyI6AHUQ4VUGiR_07jDa6a1il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
> > On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> >> Hi,
> >>
> >> On 14/08/2025 13:22, Konrad Dybcio wrote:
> >>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> >>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> >>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
> >>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
> >>>>>> along
> >>>>>> the Frequency and Power Domain level, but by default we leave the
> >>>>>> OPP core scale the interconnect ddr path.
> >>>>>>
> >>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
> >>>>>> parameters
> >>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - Used proper ACV perfmode bit/freq
> >>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
> >>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
> >>>>>>   1 file changed, 11 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
> >>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> index
> >>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>>>               .gmu_chipid = 0x7050001,
> >>>>>>               .gmu_cgc_mode = 0x00020202,
> >>>>>> +            .bcms = (const struct a6xx_bcm[]) {
> >>>>>> +                { .name = "SH0", .buswidth = 16 },
> >>>>>> +                { .name = "MC0", .buswidth = 4 },
> >>>>>> +                {
> >>>>>> +                    .name = "ACV",
> >>>>>> +                    .fixed = true,
> >>>>>> +                    .perfmode = BIT(3),
> >>>>>> +                    .perfmode_bw = 16500000,
> >>>>>
> >>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> > 
> > You are right that BIT(2) is GPU specific, but that support was
> > commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> > use that in Linux too.
> > 
> > I know some docs show BIT(2) support, but lets not bring in untested
> > configurations.
> 
> Eh, then let's get the docs fixed if you don't trust them because we can't
> work like that..
> 
> FWIW this is information from per-platform RPMh cmd-db data

If it comes from cmd-db, then we should be requesting it from the cmd-db
driver rather than hardcoding it here.

-- 
With best wishes
Dmitry

