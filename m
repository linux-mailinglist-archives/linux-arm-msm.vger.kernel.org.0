Return-Path: <linux-arm-msm+bounces-75157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B1BA0B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 18:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95DF16C9F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F6E2E03E6;
	Thu, 25 Sep 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nla+uNZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144D15B971
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818812; cv=none; b=ngscTW8RhvamWh5W/zetHU+5JIG8L0W700NNUjnXQZv9zt1i12lGeHTw8mJEuNYmBgM4VUgNKNGqa4aDsCh6Ej9F5+Ya6z02FN6rqBNfALKBJVt6Hm7CkYsAbW99M46qyGuqiAdmHNe+IgbvJclJMQ4iCnwLdBcgCGrwXo55gtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818812; c=relaxed/simple;
	bh=Ut4RvekikEgx9yUNY/U/wvhXEdvVZ8Sh73ZinAayXyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRl4UyU/Fkr0Fp7MK6JsRSHMV8cFpP+4PuK/N5NUyBDljnJT8eB1rra9Y7ovqS1TK9vFXEKsinUM+03AfPFvqjj7YzJZxr5sUQYlKNUqbXjVce3R05zBx2vzLbTtiAPP8IGc3qBo868vMK/QOYWK+8+7zqAUCrs4O8R2q8RJvfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nla+uNZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9afLX018615
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2mr004wkrEndbnMlZ/UZb115
	iZhGv6Os5vHVBivnlhQ=; b=Nla+uNZ0cAwtyLhYeCb524E9MHCXYM9e6vKSYssg
	h00wh6hgVI8O5P5VA+Q6zpoOJoF2b2Pq4TKMTZdu3wj6UPdqsTGoAsFtyN1tUDIl
	aFnvM12FVvwoMKDu7w9xfD6EZ/UIC/LzH1ODm4KrJkL1KUJUpFcTspPiy50zOjAf
	ucNYzYB51HYTpjvJOHDwP7Igqq+F24cBeocmZpVxXkqWWK8Zqzhtni/e4weWXUQg
	mgYQAkkcV/tf4QfPsP+ZgFGRv5tXhXhZ8tQK2utedbPtaWnucwNz4EJ1RItY4/0e
	/5pi8t2Sy4Z5TcftGEMV0sT9HALwGoCRPu7XyME220GkFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk27nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:46:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78f2b1bacfcso19098726d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818809; x=1759423609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mr004wkrEndbnMlZ/UZb115iZhGv6Os5vHVBivnlhQ=;
        b=diaSg5f87jjpwVtYBcY9xDzvDfpysxcaEoIw36gPTUi+cS+V4eCRh0uQiRvWaFWHCI
         3uQjVeYht7a95/IpC+BKViQ8DL+J7PnIRvbSlsqM/NV5nv0cCWnVZ+VsXKI11fVD4lCY
         +kNHj6ZqR+F9XpHmfynXJnos74Tdu2DC7d81fseecQ2hcQCuDngBv7kbDt31xRE+JDqJ
         S35G9wvPbS+0MDgE80uH35RUU8pB+oUNzHLtCJRYJhJDCq35sztlHprk75dsacCnFQ/i
         S4x57xMkSM8XBSuNW7xwkZrzl13oK2NKHgXZJiiVDuZcrLnF+WGKjKw+eY1AsytLwsGv
         ZveA==
X-Forwarded-Encrypted: i=1; AJvYcCW5U/9QbSSSHlKub08TDBRkqX6PYsATUcV2dgvpIEiz8J6cOmmGhZEJCl61zg2UYXA8jYknI42YOxRYD0TD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9enT/Up+FhJ9MqsrX+GCxfcg67nrTkyXrqZZLMHg3X20PsX3K
	uLW8XQGS9VoO636FSbj32MxZsTRaT2pvI+00AhpCx7FFn6h20sZFFiYRrEaaIZtvopVPZY30TrR
	aV8nodjMZ1J+AI6DPtYMd9tQ3U2vRq/P1q0iAtWyDxuqeUtq1jizoOiWLUVI0Hv3KK65R
X-Gm-Gg: ASbGncv5biUlbU658LwiUWPFpqqlIP23oat8UA9XLvSQAMuUiB7fYlBAjXE/OP73LA4
	x30gKYdpXtv4XO3D5Tk7lPc5hsvUDuA87wp177Ap9eZCDdwDbH5IcJCELcZgPopZ1L4mJHZclhA
	9XHOoOnzwHNAnWdVkAu7otdbx1CtRTUq8PTOxDOObMx8eRvKdFd2mi/M5hW/3gnvpIKowN0uVWC
	kxqyarjx1kf3T7f3bLTSGc3E3qNvkK9fb4MFVqwFx45d/RjUvINEnzyUYz6316PGRXZspjN9T1l
	P3ryr9OckG9i/Ff/vfbiIpRMS/k47/Bwvr8LHFrSv9uQv9Z9ohPnJHzdfXj7Mi+Fv01uD/fxaH1
	DshBujcTZaYjbIx2nYcjZU7Y6NsACWSxlNoFQJbM3Xa2zhO+Nubau
X-Received: by 2002:a05:6214:f0b:b0:7f5:b2b6:2a2f with SMTP id 6a1803df08f44-7fc45172872mr57824776d6.67.1758818808633;
        Thu, 25 Sep 2025 09:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwnWdTJ1BPazbaxUFNG2IQvEM/rlZW2m4Nxzg29lTU9VFpjl04xTbrAF3WvRoPt9K+4sLpmQ==
X-Received: by 2002:a05:6214:f0b:b0:7f5:b2b6:2a2f with SMTP id 6a1803df08f44-7fc45172872mr57824246d6.67.1758818808045;
        Thu, 25 Sep 2025 09:46:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430e1dsm933170e87.2.2025.09.25.09.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:46:47 -0700 (PDT)
Date: Thu, 25 Sep 2025 19:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Message-ID: <p7btiavlbu3wqcq62j25vyv5reusdqenz7wtqr3zspywittdfl@iivegwoqfjk7>
References: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
 <20250925-dts-qcom-glymur-crd-add-edp-v1-2-20233de3c1e2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-dts-qcom-glymur-crd-add-edp-v1-2-20233de3c1e2@linaro.org>
X-Proofpoint-ORIG-GUID: n8_pUM9OpGVxzR04gqiEH0fCws3O3iNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX516s/kIU/fxV
 yHXJx8pBZk865qVIz3P5f5v6FMLHsSRyFbPeyJHyuuXSP2C1wQWHPD1L61dBb2OR61L3e2A9whB
 50O7IIqrsqW/i3UBnqroXvhFqxqtP8wtCH6UoKpBGPNPn13rI/vcc90c3o0VTP313Z/xd6G6ggM
 O7xb7c01XoCivtFwwlrSni5HTijTeEm55Hu6tC37MseRDwk/934mViXBCRwBIBXaEoxOoswHtcY
 coPVHmalNsEAV5e+9/YbdsWhuesNv0S8tXYpCow9j4tl6KE3Z6/3CFzEMdHNjEzZud8YU5WHTTd
 YmGlSJ54e02cLyQI/CreMQ6T/RHgNLoNmX7PSXY97XiwKsd2FkrSTDyqgMIFOFjkZIuYUuz9VEQ
 bzZrfCEK
X-Proofpoint-GUID: n8_pUM9OpGVxzR04gqiEH0fCws3O3iNk
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d571fa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=3enfzX0syV1bCKBQ0NkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Thu, Sep 25, 2025 at 06:02:49PM +0300, Abel Vesa wrote:
> Enable the MDSS (Mobile Display SubSystem) along with the 3rd
> DisplayPort controller and its PHY in order to bring support
> for the panel on Glymur CRD platform. Also describe the voltage
> regulator needed by the eDP panel.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 76 +++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> @@ -536,6 +552,52 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "samsung,atna60cl01", "samsung,atna33xc20";
> +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss_dp3_out: endpoint {

Define the endpoint in the SoC DTSI and just reference it here.

> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

