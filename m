Return-Path: <linux-arm-msm+bounces-76385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC0BC4A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E0A3C33A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E23A2F7462;
	Wed,  8 Oct 2025 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtLQqwSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5B2F6175
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924592; cv=none; b=QwXzVoG+BeRBAW3vcKmRqOlZ1QAKPsym3Wr47eFt64qjWrnHvN4JxdMSdMgr1CusqWPt/Qf8UqP0Z3yyxYDwXyE8LSyl8eXlmTX4YLTj26JfnKSN8OrMMu3p8HcKzIPIvHStRRbGcqAVD/RdxvN71U/VTWd1m8OS4NoBhLAvudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924592; c=relaxed/simple;
	bh=lTDgga8MBX26FDIM9uxD9CEVoactIApmKXI7vkta5zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK90TUZW+Ue49DaXcjXrV/LD6mvSetXhQyjh8MtbXpIgYpn+Igs1tkzJ7Gb+xN6Zs6mL7ZvQJfDtMlRfAOpUftXm1kVSFSLMtdsvgYogZGJlCeX6H+sWglynYM2pCZMMYHfxDXxcuOfjCBVAxwcGQG6x0SA9J2bCPwPOExzeIJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtLQqwSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OAT011742
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f1knxwE895h//Uk+NLRtt7Bk
	s2juXaTkC3N0JijxtuU=; b=CtLQqwSQO639oW91NwkqOA2tgo457a0R3ad7To39
	dZ1GYvsm8ttIJZXIosAI+25Lzum1CCZAx+SSytWAUr0k+pm/kHz8GUs5m5lRrAIh
	W7/ZRcyU0viA9a6UIrW8qMXltd+50Kee3bx0deJ6KgU9jhUUIffLEwWz6b6aG+L2
	w3/9TyBui7yvgmrHVAF6RZHGnafTaB11G4V9qY+W1JrTtoAo2KUj7IUIbroefhPf
	6NvB6CWMMx7EhUoA7akbS+UT8MqJHjynroTOFmiNlOQGXufU1nN1KA8RTgYPVjwu
	pxtZ/7vZhdHHzIh7ew/Npi2VQsnPOODquwfkfUM0OCB71w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpw55r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:56:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso11333881a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924589; x=1760529389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1knxwE895h//Uk+NLRtt7Bks2juXaTkC3N0JijxtuU=;
        b=LQ4uVIawVl0gSb5G+cgrryIDQgfncAGR/TwuMe/wrD5LvAPHnAfPGqIQTaeQnV7Nmr
         3FE9cWZ+wkSE02y2z6hvnerxmf83ZX6IHB29Zi/KqOtZfWXy6hvMWJ1KgYG9eMeNUGnO
         O4c2ocvayMQ4zvxlJVuvS8sxI/UpD4RxQwDrJKuDNiAe0MtlA1fltM/4q1JLDSYIJZj9
         xTQeMp9epCz97njl6kDPzN6/CKz860BK+VCw+ZbI5HIhZyWumwrEl5ojo6IxcviUZasz
         s+WMw/4w+XBPlZujK9/iGI1oZ8QEsKsgGVr+Khup5ntXBnOUf3PZPSC3uoKVnbaFWvio
         W0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWxtT/UgrTTg2oqt9G5MDv6gu5tPzUlAAGvZmNsSzmFM5I4MHuQC51yHiESiZX7T5Eq/sQVhr4eETOabIGB@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNm8uWbrTwMbsyYfLJ2VqscaQKuH7VxRQ7DQZ2BwL+m08rnL0
	cmSloxwD8LUzwGtytPpzDLGTDE/ZtQdFSiduKRc67A+gUUKSouP7qSxUpXnovgSJD8ehle/GL08
	k6/htcwIfmEIE+TMSJWVC2RmCfkfyxnDRMaDMvLLe9XjrEjzbLNbFE20PLYwysoUerGWQ
X-Gm-Gg: ASbGncsrWRX4zTiaPvoxi25lN6KWgko2NnICpCBvzwi1sI+iEy01S1v3sf04Ky98+t3
	ir4KkBb0mLRSeWzfhegb4s/vR7xCPVyCnUihmXmI1sAGgXAK+bFmvNUIFT7N5Xv43l8/Ee+9Rv4
	7iexVODi+OHVRkzVTFKbCNCNNop0b4iOKeccclmIef+EV27hnfaxr7vcDyzfMWAgeQQOOuivnBk
	g7mB04/OCBsI21K55Ehh4rffTRvOLAkJUaxE6Dnuh7gtZh7abi77SasAoqgkGkf32SOIcIVdQ64
	hnREAQtfX4rJStxXSOReaPP4RL55PCEWQiy+lCzHExA2w0pyupGS2j9oquh0ea4JOr0nsMJA
X-Received: by 2002:a17:90b:33d1:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-33b51149673mr3944049a91.1.1759924588772;
        Wed, 08 Oct 2025 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4vjV+Vlhpo1bxX4HVDR2AOqNRI4QSe2mg82Psqm/L0rIOyNsw4ssPAJ9H8Pf7ehrhuUjFjg==
X-Received: by 2002:a17:90b:33d1:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-33b51149673mr3943999a91.1.1759924588104;
        Wed, 08 Oct 2025 04:56:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6311462b24sm7363069a12.37.2025.10.08.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:56:27 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:26:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20251008115621.xogashum3s4auqah@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
 <yef5jtmcfuks2w2sngxr4a4htihxx4xidsgwpro6wckbfvmvvn@jfr3dlsdf5vm>
 <20251008073214.kcanrljguox2vtzq@hu-mojha-hyd.qualcomm.com>
 <5408daec-127a-4fdd-88f1-855c90694f6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5408daec-127a-4fdd-88f1-855c90694f6a@oss.qualcomm.com>
X-Proofpoint-GUID: 4IFkdZ9knKx8PW135cXGjiSPReFWfSnm
X-Proofpoint-ORIG-GUID: 4IFkdZ9knKx8PW135cXGjiSPReFWfSnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX3c+LcjmucWeA
 CuiDw79iBe29KlGbTft/29uCbO5c7JJSWBNffA5OBufcWSLZf8D3EOlU+SrVFpo9pA93LYT3Izy
 py2gT1nPBNV4UdTBuKq2UQ/icxWITe/6joyin4Cvho7jj/xJIAmlSn1CL6qqnh7Kx8kEraoaOIH
 viIaZrZr1JWYzUVWmDzz6gOhPQoy+5saiGgwCMuOQAGVp5KizJTHsSjovgW1vCf8WJvs1/Kdibu
 cIaUyPkZTDbCQeCSmpyhUzAZ9fxfIhLYlAp7e/Uq+XquZ8QOmdD7kdEzGyFvM0waUir5a+68fmB
 EOPSgG3KWtcMgGdDeJohIY9kIUEMEurF7MGE3sg6cSHmQ1ge1c/9xLMrOYrRh22xf3IHKa6Xru4
 dWs9NXXf2TqJsHj3wkZaQucc6DP2Iw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e6516e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mJOJxhs_1O9UuuOt1LYA:9 a=CjuIK1q_8ugA:10
 a=eSe6kog-UzkA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On Wed, Oct 08, 2025 at 12:13:03PM +0200, Konrad Dybcio wrote:
> On 10/8/25 9:32 AM, Mukesh Ojha wrote:
> > On Tue, Oct 07, 2025 at 02:55:04PM -0700, Manivannan Sadhasivam wrote:
> >> On Tue, Oct 07, 2025 at 10:18:57PM +0530, Mukesh Ojha wrote:
> >>> All the Lemans IOT variants boards are using Gunyah hypervisor which
> >>> means that, so far, Linux-based OS could only boot in EL1 on those
> >>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>> devices [1].
> >>>
> >>> When running under Gunyah, remote processor firmware IOMMU streams is
> >>> controlled by the Gunyah however when Linux take ownership of it in EL2,
> >>> It need to configure it properly to use remote processor.
> >>>
> >>> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> >>> devices to create -el2.dtb for each of them alongside "normal" dtb.
> >>>
> >>> [1]
> >>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >>>
> >>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +&iris {
> >>> +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
> >>
> >> So the missing 'iommus' property is the only blocker to enable IRIS?
> > 
> > Yes, but this would require some changes in the driver as well to create
> > a platform device for the firmware and IOMMU domain, and to attach the
> > firmware device to the domain.
> 
> "yes, but actually no"
> 
> > 
> > There was some discussion around this in v2[1], where I added support
> > for video. However, the change involved hooking into the video-firmware
> > property, which was used for Venus.  There were concerns[2] about following
> > the same approach for Iris, and due to that, we have dropped video
> > support for now.  However, an RFC has been posted from our side to
> > handle such scenarios[3], as of now unclear about the direction for
> > Iris.
> > 
> > 
> > [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
> > 
> > [2] https://lore.kernel.org/lkml/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> > 
> > [3] https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/
> > 
> > [4] https://lore.kernel.org/lkml/4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com/
> 
> Reword the comment to "/* More driver work is needed */" since there
> is nothing more you can do at the moment and you most likely don't
> want to block your series on resolving the above entanglement

Sure.

> 
> Konrad

-- 
-Mukesh Ojha

