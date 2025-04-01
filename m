Return-Path: <linux-arm-msm+bounces-52932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C1A7755D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99ACC188B61D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 07:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39E41A23A4;
	Tue,  1 Apr 2025 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CjlaqXER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026171E8354
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493344; cv=none; b=dc5yhnCneCdQTe2hZhe/vXUICIXGlSLvn8BbQ71WFbiaUBw6UwelPvTsrtpJxHPpoll5GKaCzF5YZ2CCNIZTfMwXAnNx2r0PyguT9byelfwerMWnyL57spd+oF5spJ1X3piWazi27U99P6sUv0b+EXGFhDLGWIsDMgkCYtt7Cb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493344; c=relaxed/simple;
	bh=GXDDnqGcqQxffAYS7mwQQIF3EkxYxJEVlHATEWKBZ1A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=VVGb6M4F3J2MHu7/LMVxe3JZNLRziy+Rl66n2Do+QlOwkxi5i7jtR3RAegM3o4/gMB+7KDQRGCvwPVp8NsWlK09wy5J2+AcH66Jxwh0pRKTT3fcYwzNVMDtEY75UW2Ya5qOzVQMVwG5ChbfebkReAhZXJuk2il31p0t49Zf3ajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CjlaqXER; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso840428566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743493341; x=1744098141; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPJ2TXsQDmL+ygOLSu1iN7U4xXMymlhiV19R/MTt4SE=;
        b=CjlaqXEReGTCKVbGTcfhjt/xlLQ8fkCL3KIatW6K3w1b16GsJEqOKcZZh8y+upHDWp
         qU86nlDj/tJOd6t/HWxH8EFQyDuWrMF+bxS4bYpHouDJuLSjA6C2CRgbzcvrvoR2Eb0h
         ymUouiYWm+sUImvGJaKafRMvSm4be1yhjNUK5xNc5rncbZXq8dbmObkWFT7bd1vbvwGc
         uxefowWWtChEgdp1+D1DLr10XZDYRfCQoshC5i8w9cF7lFF5EFKycqImnpNlpIOv6zZ6
         yn3W5JayrVpkaB5rKjYPwNm+N5VD5tE/06EYgzSY0hV8klJLMkwdZJYFAY/1WwsloYYp
         o6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743493341; x=1744098141;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPJ2TXsQDmL+ygOLSu1iN7U4xXMymlhiV19R/MTt4SE=;
        b=ACGiabNgaZADneiw3vVu77hCynPwolYzuUqAVczyv2gYumhvt3kZgKnp96n09GUf2c
         DCui9kBtGU7ohpUkRpKDIhaDhFJ5k4g+YMuyiq/D7lE6vj2C1MLIn0EXirTv/AHCnfbx
         pnPoqdUpYzZyjMmgO4po20gFc+pLwnLEEn+AT+wVzjUw4ONqMZdJXDDCk4l5MCEd0Oee
         6HExdtToJsP9556ZpNiX9XNrVVeJD9w0AddTDk+FiOgdjK4mLVqJwHglvQYyUbgN7Gju
         lISDnrq2u60IOB2i7WWfdbgHl/IMEMQAODGII+isuTc1p72SLaIRPtDnwqSBFeI/0yCA
         bSDA==
X-Forwarded-Encrypted: i=1; AJvYcCUw6OfVJ5pGv01VGfOYkIPi+kQ+ZkM3EMHjSxZJAkhS8srogsCjJhUY8b3Qx6FdHioOrlRIpn2bEqFdhHiE@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9b0czrxD7RjmYd2I8JFJAh+uRDgW0cZBZXguhIBRnQmt4lWy
	HIweRt/r1ZlgzuLOanUaTc2825zM6ykT7rqMAFFC3G7iqLRxCopCTqBWlTy7kII=
X-Gm-Gg: ASbGnctjFOQkxz5ZvbVIhWNiw5vav4+fnWK1q6/bRYeUX9KKFcd2EdsU92/XlLsejkc
	yZRaj3R9+tnjotAq2RmK9nP8ECR5z3Z2IsjRW/w2y5LTtgKm9Jvc2zGO3AirzjPHqHYcHp/CL6r
	QotXHgTyxSb1xyTYYD0/uUf9uzUw4bCVoYaZ5BWqCeRTyjon/r2bxPS/f7JptdkVWnIIcp7gTVG
	PraLCmDR/Lxe9Zmb2LZ37oR3eqrJuVP3XUexCn2pV9y/rCirWzMIPzbgUzZ0geNYPIosn3u6SHq
	50i+F3op+Hmo+47yiImnNDnyTeImsOAxDi3NkCGAk7gt
X-Google-Smtp-Source: AGHT+IH5SFNThbqWZhSx5G09ClUQO77eHc7ObuTSpcHJ9u1Pk7Y9mnu3n7BjajKWcXm5I6bRsMYpbA==
X-Received: by 2002:a17:907:2d22:b0:ac6:b80f:b48a with SMTP id a640c23a62f3a-ac7389e67cbmr1075900166b.17.1743493341118;
        Tue, 01 Apr 2025 00:42:21 -0700 (PDT)
Received: from localhost ([41.66.98.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71969aae9sm737432866b.147.2025.04.01.00.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 09:42:12 +0200
Message-Id: <D8V4SZVFFHGD.17Y9J8WFKNHYY@fairphone.com>
Subject: Re: Venus probe issues on SM6350 SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikash Garodia" <quic_vgarodia@quicinc.com>, "Dikshita Agarwal"
 <quic_dikshita@quicinc.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
 <bb733204-ad6d-8487-ba17-b38cd9ea1ac0@quicinc.com>
 <49f8a822-4df4-0a61-b342-bd6c418314c9@quicinc.com>
In-Reply-To: <49f8a822-4df4-0a61-b342-bd6c418314c9@quicinc.com>

On Tue Apr 1, 2025 at 8:55 AM CEST, Vikash Garodia wrote:
>
>
> On 4/1/2025 11:47 AM, Vikash Garodia wrote:
>> Hi Luca,
>>=20
>> On 3/28/2025 8:52 PM, Luca Weiss wrote:
>>> Hi all, and Vikash and Dikshita,
>>>
>>> Konrad Dybcio was suggesting I write an email here, maybe someone has a
>>> good idea what I can try.
>>>
>>> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
>>> Fairphone 4 smartphone but have been stuck on getting Venus working for
>>> a long time (~January 2022). Essentially, whatever I try probe fails
>>> with the following error:
>>>
>>> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
>>> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video c=
ore idle fail (-110)
>>> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-v=
enus failed with error -110
>>>
>>> I've double checked the videocc driver against downstream, the videocc
>>> GDSCs and their flags, compared dts bits, checked basic driver bits but
>>> I couldn't find anything to get further than this.
>>>
>>> For driver / compatible, it doesn't seem to matter if I use sm8250 or
>>> sc7280 compatible or actually the struct I created for sm6350.
>>>
>>> I'll attach the log with some extra debug prints below.
>>>
>>> My git branch for reference: https://github.com/z3ntu/linux/commits/sm6=
350-6.14.y-wip-venus/
>>>
>>> I didn't try the new Iris driver yet, mostly because as far as I can
>>> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
>>> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.
>> The good part if IRIS2_1 configuration have firmware support with gen2 H=
FIs.
>> Since you are wiling to give a try, let me or Dikshita share the firmwar=
e with
>> you in a short while, and with that, you can directly try SM6350 with IR=
IS
>> driver. Given that we have already validated SC7280 with gen2 (downstrea=
m
>> version of IRIS though), i am quite hopeful that SM6350 can be up with i=
ris.
>> FYI, iris is having just the h264 decoder at this point with RFC patches=
 posted
>> for VP9 and H265 decoder.
> Pls try with below firmware bins on IRIS driver. We can debug from there.=
 Hope
> you have the access to download the binary.
>
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware/-/commit/56035=
bf6edac7eb4d2867528c598eb646ee68651

Hi Vikash,

Thanks for sharing these binaries!

I've signed them with sectools for my device and tried them first with
the venus driver.

There it looks like the firmware doesn't load at all:
[   44.798028] qcom-venus aa00000.video-codec: fail to load video firmware
[   44.800367] qcom-venus aa00000.video-codec: probe with driver qcom-venus=
 failed with error -22

Then with iris driver and qcom,sm8250-venus compatible while it does
seem to complete the probe function (I see a print I've added in
iris_probe before the last "return 0;"), the phone crashes.

I have the following diff on top of iris:

diff --git a/drivers/clk/qcom/videocc-sm6350.c b/drivers/clk/qcom/videocc-s=
m6350.c
index 84c6a1fcb395..504dcaad897b 100644
--- a/drivers/clk/qcom/videocc-sm6350.c
+++ b/drivers/clk/qcom/videocc-sm6350.c
@@ -111,7 +111,7 @@ static const struct freq_tbl ftbl_video_cc_iris_clk_src=
[] =3D {
 	F(240000000, P_VIDEO_PLL0_OUT_EVEN, 1.5, 0, 0),
 	F(300000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
 	F(380000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
-	F(460000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),
+	//F(460000000, P_VIDEO_PLL0_OUT_EVEN, 1, 0, 0),

    ^ this is because my sm6350 opp-table only goes up to 380 MHz, SKU 0
    can go to 460 MHz but not SKU 1. I didn't check which SKU my SM7225
    is.

 	{ }
 };
=20
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/driv=
ers/media/platform/qcom/iris/iris_platform_sm8250.c
index 5c86fd7b7b6f..d958a6540949 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -61,7 +61,7 @@ static const struct icc_info sm8250_icc_table[] =3D {
 	{ "video-mem",  1000, 15000000 },
 };
=20
-static const char * const sm8250_clk_reset_table[] =3D { "bus", "core" };
+static const char * const sm8250_clk_reset_table[] =3D { };
=20
 static const struct bw_info sm8250_bw_table_dec[] =3D {
 	{ ((4096 * 2160) / 256) * 60, 2403000 },
@@ -72,12 +72,12 @@ static const struct bw_info sm8250_bw_table_dec[] =3D {
=20
 static const char * const sm8250_pmdomain_table[] =3D { "venus", "vcodec0"=
 };
=20
-static const char * const sm8250_opp_pd_table[] =3D { "mx" };
+static const char * const sm8250_opp_pd_table[] =3D { "cx" };
=20
 static const struct platform_clk_data sm8250_clk_table[] =3D {
 	{IRIS_AXI_CLK,  "iface"        },
 	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+	{IRIS_HW_CLK,   "vcodec_core" },
 };
=20
 static struct tz_cp_config tz_cp_config_sm8250 =3D {


