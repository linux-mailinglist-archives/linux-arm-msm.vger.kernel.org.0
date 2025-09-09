Return-Path: <linux-arm-msm+bounces-72791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C9B4FE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BE73609B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FA156B81;
	Tue,  9 Sep 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozu9A2xC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8C1E520F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426420; cv=none; b=XQ0a3G+lyPt3ACC7Qc61hYWH6EJJ//pvf+YiSEwrvoYUNG8bfCEh65m1efIVykwwHlKr1EKFg2yxxxj/X/Yme7PcnmUGIlNEWOxDumcCtH39xquPRU29KMYxBLVIOjEh0RAjxCq1o++T2rZtHOnDTwjcO+KQX29AELkcfpTD8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426420; c=relaxed/simple;
	bh=LYg9kkS3/eGoksJYpWuzYpEAsLarJctZuZ4l+/3X2/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDxO/D1niSLFPjwfPqDQnuqKaWYBsDCcld9+dRKgmx+mqtkxf5o38d0nv+/sQf31aCEAuv4cfDL0rFNmUsNemgCUB4OUfTUuhmMf0qgoDg6ZMXPg3KopN8AQSL1U6uOJ0g+Bjjy2Zlk6P3Gpa0RSLKupIQCyR4CVyXyDlpfjvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozu9A2xC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LlWY000698
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RaiuPSwScN1So+PWSJmzhuha
	k5hJv4sAaqtK90ZKdho=; b=Ozu9A2xCN38svH8qQO4SH/IbWO1Epuis5xzMXswO
	7+b4Wp9gy/wGuogKEFs87voIPlwJVd0wXF8+bnwLOW/I3Ks9Prh22YEbJIVUIAHL
	N8QTVvITH4REGAKtK35pU2W2ZoxekQj9I+jaJgMePRWmduvBnOMU+wocHN/C8Yj1
	MLgwrGIVV6d6dL055W0O5xQl8yeF9fMRf6hiDIy7825PHCt/6w/QCbBVvLPLeB9b
	+jnlsT14oC3tLtqMo2i2rQYASzN/Sdo+VuU+EzyFwvzZt8x612zYU79rIot1vNV7
	L+RyeDK7Yflrvkz9S90eUKUZ/EmjxngYyeVDN3XfRnwNYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0abg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:00:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72048b6e864so57721876d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426405; x=1758031205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaiuPSwScN1So+PWSJmzhuhak5hJv4sAaqtK90ZKdho=;
        b=l2gsLoaQU7JvBdnhK7TcGCUug6yPnZaREcjgGwOFG+/QzsJ6o9Sre5f3ReBpZd0Zoa
         Zii4KGNSQlHJXoHeUZTH879dB4eEao2jxtjkrdslyOC2LMQxtwqPbmKr8xDXslcxefgG
         dfEuSX/T/ypPj7Vsy+oHcgo3pBvdb64SY7LvF4VmXEFK4pNu2enQk9EL+v6o7LttE3RR
         liFAaT+drYAp+k4QECiBRpZrKUZqqYr0HcwwyGawXcblJSwhwnejC7/PjifT1Ket6/+r
         d47UxGa5FxsLjdDa+sRbpzEqAPVsqwnPqhJxxzEND43UveXaUO/AWiO80w/bL2SSMduU
         Z4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfXP04TYr4OQlW5jnQRKEj8G8HHb42LSNPLyxQT4gS+MuBNlcVp0vP81dJLv2TDfOc25MJHPBwalBPIyxT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf15rvkeZ/mpBsjSdCo8XXSxK/hZDv/amaryXbnzfrBXTj+ppk
	c+4Yhgt9fQC0Q64sNh1wSkTK8O+LwBMZxAJwsbhwhn5i8A+Zbf2m7zl3CG6FX+y37loiO9P83Fq
	pWs9xI+FpCsZAufF0jAHqEOoZdvJtkEAMtITop3iEY9hLFtA2bUdSGCltdyrygaWhGfo4
X-Gm-Gg: ASbGncvR64P1OTebUQIDY09nLaaRJt2fGtbtaR3feCEzWIeadp4hIcaMtYaobM5u0k2
	zlJm4nVw7Is73bNZnANXldg2th+CgHF5MH4tYwBaoU/Zs46/Mg78SJCtgmbPgTT92V/Q6KfnqfO
	gshgt+uAFn3OosqdjdLKuVlSU8e+2l6cazQbRnfQ/06jxBsOWW2A+ai/sNsMhH/RsQr//NfIJ/k
	cEC5vqqCYrr4i8jXCuYn5yAZtQyAXydqGtXOzFXk4SxuNFRZX74GCUwvDk3QRQDEVcGLR3U+1zE
	zr1BE5J86LnoxMRik6WLz+zbo/E7N84WOcfIk2K4AcWoux3TOSacBHb6evrpTvI/IgfxyKWBmrd
	kMNb20GcGbMUI0Aej8r8mhZmhzh62IJWfdSnH8i49Ehx+sga/UnHg
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16533306d6.58.1757426405037;
        Tue, 09 Sep 2025 07:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj1Ux9j67rzf37hWL5A8Jozn7wOidkUvzvPy9tqT1pZirgwULyxpmO/uSUwFeT3zwLe1DRvg==
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16532636d6.58.1757426404347;
        Tue, 09 Sep 2025 07:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246b7sm546172e87.13.2025.09.09.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:00:03 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
Message-ID: <ez5d76piv6srwceueajokplx73xj6xtgvyqgtbpjkdtoo7ijgt@7xn3uxzdcgvy>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-5-quic_vikramsa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxT0mfa/jr/j0
 aW6QTUXUhBrB8A817bGOqHAom/86tYgb8DaCtMOEZT+YnPQNfMTAoFe68MqiLfZx85lXlGK5Q8c
 lbZuWKr3mqm3D+2sA8c12IYGorKJQ6mvi0KwMWOtvOkblETnfZroEqzbk8S2IjlEazEtJIUhFoY
 n35LCqzbjtIRIOfer5OTWeK2d1H7It0YPoDoRBG0+ZfkLrarLCUW3rwI2FYIVbbnd/RE2XcdMtC
 onGjJ/3p2fzzkX5Hz+tBzHhveysrdGG3yNCYRAYT0EHsygdJpgIq6siOzPCULnh4D2wvRwSwl5z
 48IfyZC3+M/lWvnEVza6m+C7gLBK+JQPX8CEq+wPg9dBODLMTbFILMSLQEoRDvXbxjl8MG2cXtT
 31wnChxJ
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c032f1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=vE47tFul03BpYyIIO6YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bXf2CPWfwmhRZ-Y8-uBFuvVFhdOz1WJi
X-Proofpoint-ORIG-GUID: bXf2CPWfwmhRZ-Y8-uBFuvVFhdOz1WJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Tue, Sep 09, 2025 at 05:12:41PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.

Don't describe patch contents.

> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..559db6d67f06 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>      items:
>        - const: top
>  
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -158,6 +166,8 @@ required:
>    - interconnect-names
>    - iommus
>    - power-domains
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>    - power-domain-names
>    - ports
>  
> @@ -328,6 +338,9 @@ examples:
>              power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>              power-domain-names = "top";
>  
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

