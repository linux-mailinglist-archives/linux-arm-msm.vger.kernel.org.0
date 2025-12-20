Return-Path: <linux-arm-msm+bounces-86030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67427CD3305
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A223007639
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BADD2E62A2;
	Sat, 20 Dec 2025 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isXmb/JW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYrrH6Es"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C25B2EFDA1
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246592; cv=none; b=Yw1ZxWnmUM4KCEWI0CbeiENuep2Y+Y98/tndfWtAhzFCbkmWie4tAIM0Wg2v+VlswiaAjNxVOCsl4QMf8LUCsvHI97JrvwkdkkT4mRAG7YmYxiqTYo5sjyn8PeZHyFOhfdHsxqKX4lZfnkh1oLCo53u5S3/eOjFjOW+DTbd9aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246592; c=relaxed/simple;
	bh=oqsEt1aX7D93qzOG08aPRYFITxsTR7FJDqIaRvCW35w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m59T9ITjcwWwWV8b88quP++Ag4rErbxoH/tNWQ0TeiUVWnGI4QInvV709ncqtxMw9QITkEQuBOnAv+djBZpxhbqYVUKtMXcYrY9VTPDMp8uw17aAWY7eaN0OMKisPlJBTFytFCYVtshFXTYgzvC00FH7D9r7xfPC8I5lD+F3Hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isXmb/JW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYrrH6Es; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKF0gsK1826911
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nEe/G3RZ+2mNhyGb/G1hjG3b
	iVKdP1NzTBrwas1MgEA=; b=isXmb/JW3s2npdBibjmnjnCfDvDYEWpsS1KCaBxt
	OZwRwpcc69hB03fast7eSKaGqL/SuwTgpYkG29Ov5bSVGEOZSsuS3Rol4+vsPq4/
	b2dGqQ7UkV1IcPaR1BB1NjldA2YDEA23JlfqrEzhINZkFw83NReV5kSy0qy++iDo
	XGSVZZEYp1HWN6pLW0JvZubKwITYfnMwxbY+SV66FvMb+YqBScyzleY/mOe49Aj+
	/eKAOODRCjCRIV68ZmGA+dFDgWPYDRJSe0vHPZn1VhXhOrKlq9w+zm7NDtZadvsv
	2Cpd98i1cl2RrGciVdVcZ6+Wi2Zrrg0OGwyKr3x+1OIZDA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mydrwcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:03:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a39993e5fso63785016d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246586; x=1766851386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEe/G3RZ+2mNhyGb/G1hjG3biVKdP1NzTBrwas1MgEA=;
        b=kYrrH6Esx5IrqXgRI9djhsJQocy+2P08sfk6tvBda6g7hnf/YOGaodyZzNrn2cUAYZ
         oM8ECgUlT3Dx6jR/SxXqNlOcjsJxvPXAX8TzjAwJpWqjXgkp2kBUbmv95Pj3zt0idrIz
         lo+lOGQ+2T8ZCbRBE0kU3vVrmkc36TKCw1cf0cF440WIcJioRV2gs+8u9uEsKe/AP1FM
         ba/ERjaifpVDZ3vJGNVlLaDeH+GuC7pLL5TuwbEUwTzvphi/F/9j5lyAZLb7hNarsm71
         c+kctDwDza4P2nmPg7FI173CRv4UIDSJNXrFbrFDF6haHMvyVca36S/RaK7rCue1Cktr
         MkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246586; x=1766851386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEe/G3RZ+2mNhyGb/G1hjG3biVKdP1NzTBrwas1MgEA=;
        b=l3F+EsOx4hwKBgJpU2KoLvZEuUAb5Cs6CzJPBeGbIJMlsk1T1HFJ0k9R7F5CARaMqK
         f7m8z1Kj31ma0ZnR7NVjOm5r074KzAzL/KW66CQzjtJ0XQxOsdmjCVdEKNDZmrGSYUcg
         fP6hBli7im+Vog1qygQ5oF2YZxK5O1Tavxm2O12+Tm25pQZcygYfvoyrLKAGfp4qEJit
         bNibkX7S3uUFKZWcVa6ZDiY5w5E9+VAgLjSXP9b15YpJu2l2FsG1LlR0D1uN/QMHQ9hL
         unke2EwFbD4ZcaJc/o/jAZaeDlzp02o+iuzWytnpABu4nFL0YuE4k28sKkO84COMnjhK
         3+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB+IaB4/LECfXNz31Z4S+z5YMoEr4LulfE0K4DYVi7Uc5rlgbMvyGPBS99p25SbCOyjgwO5q6Nq0uU1F38@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1eCr1D9KriExbjpn/RNahbyX+ooiKL0Ldfd6QIxb1vKVvT8l
	mA+BR0HB8tcI84yFSWx3vz7o9U9EOc+BVimygq+mfqmotX/v6RKp28bWCKfCQ7Ukb0ZuUTaSfRr
	J2H3C1O0l6B+xdIEsovOyE9evcZCsIJD0RT+yYh72WtK/tWeAZBCbDmsyZLIfYOaAwizz
X-Gm-Gg: AY/fxX5Ott9M/scarfmXHDpy+ZMo65bvpbgWJccbFORzvhhN7meUvILIf/gw7R5g6oH
	xxxVMASYLkFCxMYhIsOA74kmdZO6yFqAmCt17iAIK0Tkee5AxCqQ4gvojeR7cqNhUFII4ax5/aA
	YpdagpWEoNIldEItvglLD6NO+LRvPBC07lD8ZUbyma/F2aNKFEtaJAr8LT9hZfT8klsmA/mDaKW
	fYijvILSBV4YoGNI5U5pFsjbMZ+hFV8p1/KkKIrs7ey5tfi2BR7w3yMTfrLjsFecUH5VGcMujwR
	9fJZ0iT8r6M4/OhY9R8ZbWvPNVy27k41ppApG3UUIVMlhCfNBnzHSdOBH9fDi1pVujqBpylpwrE
	tt9OjmQEhuqMjpVNtINXbFsNWM9I5Ip/PdsU2s855N7t/Ggvb6ucBkTQP22FITZXZF2ToZyKGCT
	2XhUCi4qz3UJsgCwAhEGjVlXQ=
X-Received: by 2002:a05:6214:3f8f:b0:882:3f45:c819 with SMTP id 6a1803df08f44-88d86960f48mr103830286d6.53.1766246585774;
        Sat, 20 Dec 2025 08:03:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSevMYpZwQbwXFYn8G7B/YELQOrg2fZ39XC7g8Q5HD92V1itWIz5rn1u0pqyZfwMhTLY677g==
X-Received: by 2002:a05:6214:3f8f:b0:882:3f45:c819 with SMTP id 6a1803df08f44-88d86960f48mr103829506d6.53.1766246585153;
        Sat, 20 Dec 2025 08:03:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f4e4sm1578227e87.83.2025.12.20.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:03:04 -0800 (PST)
Date: Sat, 20 Dec 2025 18:03:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI
 port
Message-ID: <tdloe6zcjf6fj2unm3lxhgsgewwctxjyv7sxzvmfpqnhpnorm3@4jf7x7febu7v>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
 <20251220-asus_usbc_dp-v3-2-5e244d420d0f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-asus_usbc_dp-v3-2-5e244d420d0f@hotmail.com>
X-Proofpoint-GUID: dQuwimEtAHaGA5PgKewmES1fQRjhfVG1
X-Proofpoint-ORIG-GUID: dQuwimEtAHaGA5PgKewmES1fQRjhfVG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX9NOE33Ot9R8U
 SPujhIC3XH6mmMX58FWhwuf1H08cbax5ex/A5dxzTy7xUXrjl92IatzMwJqxMXtmAcN8cIfNgfy
 3AOJ3Q3XlINl0l61YZroq7uxzAednoiJmSBhMIzAW2dIIA9n+9pPl5NQp34+dblSoUpZHXYbmXA
 mgSiqgfWu03WP/134gASo8Wk8Yivu0597YbpcipFazoE0GeNwqzkpp6U3Jw2viNW5SKq0w2Xk6+
 AY6yfWQ9xYrS1Kd1yctc4fE9kevZJOC36tP5TKEuHAe8dpO9ZDZu0/q59Fdzfpli1ncPHe+hYYQ
 ief7OIFIgg+AAGlAcQJ3sswfeS9ClZZUgu2T2q7LEAB8KJYPdGrEKTc7viu83KKiaE2xb4m2qLJ
 35p9S1dkQr3DB92pt/wDNEn1XCDe9YnbwRsJ2zJmr0Jmk5IhDBgCWWiTWFEO1qZQ2Ivovv5k86m
 FtEX6+cqt+NRVZdkdSA==
X-Authority-Analysis: v=2.4 cv=N6wk1m9B c=1 sm=1 tr=0 ts=6946c8ba cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=Bm6uNJzs0lXfCfon9C4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139

On Sat, Dec 20, 2025 at 12:38:58PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable the HDMI port on left side of the laptop.
> 
> The display signal is routed through a simple Displayport to HDMI
> bridge.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

