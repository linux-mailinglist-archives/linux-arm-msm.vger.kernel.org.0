Return-Path: <linux-arm-msm+bounces-58205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066DAB9B17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9828B1B6558A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D232376EB;
	Fri, 16 May 2025 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRqR66ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34612238C0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395116; cv=none; b=hc1+EQjloUfQDjwnwFs9dQN7QC7qBjCCj4QHIuXvWnuCH+IXv8lvDrfLP64VV+z+h+y2cfIBPyzxS65u9jqsLyKsw1pQCTR4pCz3XpfoLDB+uAOnSWNLnVvBX6daHm/6SYcmQ5VN+XWa4GofMz8VF/eH0HcCFtOQyqRS7ytiNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395116; c=relaxed/simple;
	bh=FycK2ZODVKZ+lpAYgjUK8m4GTFrVQc0AVRZfmvA+wIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvdpEUWXPg+09tQ8I+e/3Is218LSIYd5a+EnXel/rjd73pvwbjm+O/JpsD233VOrxVrOekvSUGMfQmMNZvbacbj7/TWEN3gf1SGKl6jfo4H7HklC0zNq6oSouXMohm+BSuC517EebDqodF1nb8+McbwQHI8b2SGKMsN0OJdi0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRqR66ap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3Bl5V019550
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=; b=dRqR66apEnvPjJPH
	yeID3G5+Rg5NPfrXuFh3aGQIqGG5DIuplLekO0sl+RQJkooeU4ONUMMXJ0X3RCvW
	3ktUwywPWGnVeY1XUpZknIlM92ZBbQnmZ/6Qiwd3kftYppZep6jrqsPQPMFWhENh
	xEzh2sxpEvSN384z8sFftn/0k5TDMkA28Seumy3ILgk4y47lJP+qd0EDaFDHkDb5
	9Y+Sxf368DK8pHZPpczNgJCcuwn7tuICBNS9tbuEEVrD+4iITgb9J6uAK3pKCwcz
	cwcAVUEcDhUXO3WeyLd1zzUHSvWV5Wo64a2CFcFCFV1fFgZbE83sbPvkwxzo2cnM
	lbLKNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnspwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 11:31:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-49452798bd4so5105681cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 04:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747395113; x=1747999913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=;
        b=fHPW7feHvRGAojRY7v1+LqGLKDJKxjYgPLhnpXlob2otYAvYx5NyGJ24lAJF2IPDSH
         16aZju20AlMpujKddbhvKdeFSeA5RvkChAxORIXxSI+MEDw70CPjpdzrb6KSv1otW2YO
         ozTiYGqPlMqMGy4wKmfNKcqY8EeYVDV7pzuJCdaZVLkdmIYNhlw1Tdriuz4Yk6G9krmL
         5E5V/7fhhak1D5uZEtpAIK+nXIhA6C/27BBAnY5zeaiCAJ5L5wsMzD7SaE2/ENn37LVf
         xbexT+3O2+gUNlxIy6OCFj+BtoFb3Pbj/VOa0Njn7aZhRHE/tyMVi1cCYrdgV3AVYvhP
         0+/A==
X-Forwarded-Encrypted: i=1; AJvYcCVzE/UNwzMhDeXVpG5Qc5TiSErHXcMs6TNYSHZr65750u5j4hNqYWb/Azq21/lZnzEnlsTGGpk5qHOMQXxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Qw2NOXqAfSyoCHbJGFMmKTDFXU4z38z6jDeXpnM0c60pBlGq
	iPnRXG01/9XlABk+1PZgqlaKpRI56UNFKTWoSaU3NkuvVpKJ/gamQ4TMZrQk7OLkZdZCVsXoZWt
	0PtEBJp0cDPyJCONUgWuxTMUSGWo5QZGBzWXHfiRY1vsC5JTZIhVt1Ken6+6WJEwifUlJ
X-Gm-Gg: ASbGncvnX0fyT50W6oduvZ8M+CvOq+z8If8UcZ4qZ3t2QQfVEyDVw8MP/PImCf9tHGg
	Afc2iGdO+DrdJDi6aPxbs47GxISAlhMVQ5Jys8bQfl5B7/cOD0s69/HJDbUqYon+BnU4hS8mar5
	FsEt+j8Yj83OL70Nl2RKscIl3uQFTFUW0tbU7gIlUyShBZdCw5jYwmRupbRdPSgKWqSm0vwcP7g
	flSQx6SzEc+TdpX5NOkPkmeBBiSkyFBehtcXDploNssR7Ey1RMzMvPZ8CAyPGbPriDvoHZ54tAu
	NzVgDsK4gatvdpgBD58j06gvrhXzRruYI1wXvZYsv5pnt7H9BuB8XNsxS0AuyPCWsg==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20294226d6.1.1747395112923;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCEBLp3n/whIhi4REkgwi84pjCbz7w5PCZVecxxq7YLAuV1dBIWRpjJYZo6uKW+5BD+6N3Pg==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20293946d6.1.1747395112304;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6dfd41sm1294532a12.35.2025.05.16.04.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:31:51 -0700 (PDT)
Message-ID: <f8e44e19-0c86-435e-adc0-b9cd5b24b1ed@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v15 5/6] usb: dwc3: qcom: Configure wakeup interrupts during
 suspend
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A47RlFGgB5bWdlJW6FQdKbryNFv_TKn-
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68272229 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bXvnuBKqF766Z0xgLQAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A47RlFGgB5bWdlJW6FQdKbryNFv_TKn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExMCBTYWx0ZWRfXyYG85t22osT0
 Zc7QJ1jzo1ivy6fVPfZyPjArqN0oT+wrEpm/8ZdiWCvVrkCXqLQJSxp37AMuTQpiRdwx/be0ulB
 DIy5lDkt7WN1qwYqItKpbalgC5JpIRYMntcZ2g2mNLFI2BoaMViCBAkNK4D+8kyyL2z8ff+Sb+z
 hrEqwo91s1lRCF0ATXIcPtKrSiz1iAlZ36XepWjrW8wz/Ps4Xg1hUU5XNjVzTjYuIB+3BtBnqX2
 bNS8QaN8BBo1HuXS7JtH9R8DrInZaiP63wBva86sh0aWQoI6LWfWVbZSVoYOZrxwjcAMi2LG2qd
 WOAtsSjXh7SYIrfLMv52fxcAwYRWxFliVcZHrd+Vgp7LRioKlXbCDD/2IjzlxYONMiSznJLRyka
 HmkxPQtXMfxmwbhSS9QnjB+yj7CEwiT+lO/QF5HFN72L9J8HA1fD3dKEDG+eQdsOrAJO9Ksg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=937 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160110

On 5/5/22 10:56 AM, Krishna Kurapati wrote:
> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Configure DP/DM interrupts to detect line state changes based on
> hs_phy_mode. Enable the triggers opposite of what the current
> DP, DM levels. For HS/FS mode enable DM interrupt and for LS enable DP
> interrupt.

This is not what the patch does for FS

[...]

> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {

to do so, this check should cover FS too

Konrad

> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
>  }

