Return-Path: <linux-arm-msm+bounces-53059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CEA795A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 21:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A2797A5339
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 19:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434A81E9B1A;
	Wed,  2 Apr 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1od+kH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EC81E51EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620874; cv=none; b=dgf+Syu8V9+lOnbfTqVXLy4lGWta7q5Lr6OpV5srSYArAYZxRGIAUcpEHqLA6M49IoTWuhrzbrBJ84mYRHcm8DWFkAeuR/pN0O0ByruTyW3zgr8wnma7Clj+DIDJQorQ1uAo9kamGHJt+lPz5f7Hfzp/+9Hv++xWMwS5eYJbs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620874; c=relaxed/simple;
	bh=nsq76gksv/CQjLrekPMlJY9e0Z3fWNmE406AI/XQB2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4tBWM7wQhevWuUUgZkOB5ZMET9cm0YD5tDlyW2aBKbLNSltrmiIH5Y1JTebhsIkcj0dnF9Ibne/4kzoAf+RRGXr9nPMA4eU5edja91PJDwVrPB4vMGXrcSYo21dEVi/4k36v9KXuyDSYGGXEYk01JticrXybSGPkDrA3vZahHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1od+kH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5329oBfK030905
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 19:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LA1WOhQTX5ByQ9v6PfWc2mZW
	1spbBXtueAXo3bqSDbQ=; b=XI1od+kHQtwJiuPa/LY0dHthPp4qR/eoGoTaqKw4
	WV7e5ihx3zU1tau9huE/G5OE2N4tNJEMZ77lAAibREy4/Qmyw6k2H64sOJH1Ri7Z
	47OWt85AvO6qQMOlR6ytfYOE4ZElqCmoPNf2gnLUKBevX22uUulrvrvzC/6SuApw
	fQIiqwJJOpRlahR42Km1d9n9PbvzHAPlxwtv5+mQxGthcGyBKUDdL3oquRkyiw8z
	hf20O2xstFk+v8RH5P/bCuu+9OmShYaZLDwiTKe1ISFxhe78vrigS0inB3s2Fw3A
	msAyJi/TsrE98XWr8EhUAeamWYHDhU5K3ey+hSsEkuwnAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recpmun2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 19:07:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so26031085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 12:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620869; x=1744225669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA1WOhQTX5ByQ9v6PfWc2mZW1spbBXtueAXo3bqSDbQ=;
        b=RES4F99OdWy9/mU1lFJkzOCWDH3+XWMC9gPGf5kN9sk3kaIfS0zZ9HMLDAwKJQei1K
         v84vZqNu5hb8NbO9ZRbh9Fskh+EYCa5OBvNjw1Vv4+aqzJ5fFYAlm39lVRmTqyhYH9IH
         a1LWjUMoblrsQ2JoUen03x5HrrmUw0Qowg6Sqkd23aZ5ONMc4cb+Vzg68vB7T1daajUO
         Q5sFAww63JWXVW1jmwLA/m1/V9HNzCapR9eXaj8JnogXtUKR5i1WvA9DIsVfzCUWUSpc
         iB34nfrjDiR1ULXAhKkUnAFAOx7lfwDcGLfnYECN33rE0HnBdH0iKCsJlWTRzI1UwaSC
         DhOA==
X-Forwarded-Encrypted: i=1; AJvYcCXHTJMAaNhB7aNZurEbkcSUn0lQvVhI/ButH9qDabwRZOBsvWDv5t3uylO+wyRsTVNRDJnKhqBv/+arGU6C@vger.kernel.org
X-Gm-Message-State: AOJu0YxF9VR/VZpZp1lCcFsiGedzwdUqvdok2B9tnOavrmLdlvmrFqpe
	1DXE5t1FceNXwu8ldYm3oXHgNXvSpn5XXVUMCNtRdG0IjulBnZeQzKfNem+GOBREbHQtioRvPmr
	YgDtL5sdMP0UmA1HIffd3GAh2Saap2FwkBLedh5EXW/W3VimU8osEnavdjYm+Maww
X-Gm-Gg: ASbGncvjaccerD/J1J97CQdYiwLa6HlnUdjpWvuSc3ZHAyCv9aLbpqChQDUf7LTSRFh
	NZh4Yj5mDUzuPg2qAvkZ/ASWh4Ld+zBrRNqYWZ6Lim8T7j4YwPknbLRRQsp3gqf32TUKO7dEWbE
	5pRTie+af8rMMCl6EDDTmHqravlbadj9sEdHvPunJF5m8t4Zw+bHyA256gIS/dihxMxnnZzR9al
	W6SRRRKUS1+nbUm+D+L+S+neo7+HDt419S2PKD0WU0RxakYR9YVOEn72cAorUOkH043BoEFa49i
	6tKNOA5oTXRJ40LC6PIGRdu6vOG6bZhYeSVL8gy8tsSuvjtA+cc6JN42hSPu4f3MuJofoFGYFG2
	E4xc=
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c75bc8e3afmr1349613185a.48.1743620869336;
        Wed, 02 Apr 2025 12:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZZ608u4zqFw2htoAry3TzhWNQ1iLzSerIc8/NM1Iiada2nzhQbeC8aAg15XvOdwOqWacIQ==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c75bc8e3afmr1349608585a.48.1743620868984;
        Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dda97350fsm18626371fa.107.2025.04.02.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:07:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <6fxnxcrtihxcpmn3fy2bb3tz5xoeqhxdftvurarlwvto5vyofx@ff2sfftyz5cv>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
X-Proofpoint-GUID: IoHHEHxIU7R-r97MqQfnnBVWPLM_6vrb
X-Proofpoint-ORIG-GUID: IoHHEHxIU7R-r97MqQfnnBVWPLM_6vrb
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ed8b06 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mxXJVTWgdfz31GLmhacA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=585 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Wed, Apr 02, 2025 at 03:36:33PM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

