Return-Path: <linux-arm-msm+bounces-58441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A7ABBBDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DC83A1B0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DA626FA7B;
	Mon, 19 May 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVgQlqwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4527510B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652501; cv=none; b=TX61c3UJN7LqmYgGef4gWUbRvKQGHG5IJfVoN/KzDWm+U/GljCGKpKUU6vpGLAOiiGt6aPZG66w+z0sHjrlqJx4biQGX7gt2WiN8AKh3bLjC/SQNRrnktw3ojf3mC61IrE0ydsuMC5opWzLeCHLyljvlg/KHOo02bge5gHYypvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652501; c=relaxed/simple;
	bh=ZUsw6HDpkokcwzIquJ5+cZ4i6BF4ATZ7/SQJ1RjXOnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFy4oHGABy2+CSXYR0hswc8xRQjQn+jKNEWoQBha+VNRqDtYpRxCsFWgjadpbL3QSm3CsDy78v14aF71O5c2qwYe6TemvVc3A6awRyXjASboZKghQDFga3LSoacFzxi2ukg9EJ3ED0ztqI3lWQsU6GZYsCUXM9AnnnyCWpDkopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVgQlqwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8pI2q027166
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeyIDj9ITmlg4UbTsleNvBIjtMOcAznKnaaucglFJbg=; b=jVgQlqwo98uDWery
	807Wwz4XzJ56eiN5p0+kE761PJx6+8earbKQt5zkbCNutxgPvS5CrkSNao61fZQM
	0KKw7s+M87jucNoQEdLiHSv2C2J62nur6sqCr9euy2Q21rQUMEJ6TfzOwz6bYbGl
	QhYwuNBRxdCVSGwSamMKHNXOmqaEUeGEhpAx8iWu5QKDjCg7tHJbbharEyyAqIZc
	WwQrMA2ZrcTfNpWrvrFovjPuX3gGBp8tQQLRNZSQ5HD4Y6Zg1BAapiV8+F0PP3cT
	QUQ2B5cm6MGkwPFtyLCd3/cgLMqslo4oeG+D8dWhtZ5wehJBh69iv6Nk8QYagzL7
	T3tpoQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9v3f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:01:38 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3db86648a91so24559785ab.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652498; x=1748257298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeyIDj9ITmlg4UbTsleNvBIjtMOcAznKnaaucglFJbg=;
        b=aKOwnZdMs/wgGC/3RBf+SDRvTSHkwhIVCHMtseWUXb5mV+NIx3v7lIuhBG95boV569
         pfhEQQR4zMuIAF4kaRXETvCu7Fki8QE7qGc91cgY8yzeCtPyNtMrU+76mxIaIvcQuhhD
         RDsWns/9gQ6HQla8CxmvPMdJ3szdDPVUs6D8SN4aikBdSIPBuMdqfA70iVocUJtEbk6S
         qPzanBg18RWqQnPw6oYRchNDZtpA+47re/WrszgbhkqcHZ1CAOQt2PFJfLdFoBu2tyQP
         VoP44jBPGX4FPPPE69n5WnYOEYWhhw2eeuObVZWswN+C4rcvzoREi3+w2ML0Qt430qrk
         kWOw==
X-Forwarded-Encrypted: i=1; AJvYcCUhClwAOMKwTMyIa/tUwrQ2P98Tcgdzx0N8/abSS0gc0SyUylWyuNSIqZdPiYjYrlsWaU8ZGrT2KYgvI4MD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEElRH7xBLfW8hGAjknwpLFnaAlfWHZLQOFjK9OIo6Ws9pAPLw
	LmAuvAXq9cNlW+zxGrtwwVQoIN5+7vrMAXs1rc0sanyfzCxypYTy337O3BdKR4Npcc37cpSeMvy
	xQsBdTKSgrbnjyxQ6IjPgpJoflcX7h0FA7cbqyHmugKbwfdkxSYlnDub0ujow9YJ0opUD
X-Gm-Gg: ASbGncvwidouGbfT1ull2LI28PcvYMDnmWY03hAm3/D/GwfpDoAqo2bc50YRDwKQ/Ts
	TZmxs/JPHdyQMUwgRtuRm00CwWYXUiVxOCz7ayFTesUXa1Y5cvG7b/2TP53BV7L1+KBcIg0vI/C
	Pr+Xv4dcbwB7AWxGPka57Vxc7Zoq8doU3QjjhFGlg2LyuMPYTS1HDsUNnV6LumQSKGYwI4ZB8ss
	Opl9/iCB44fYNaJWgk/r3nSl3MMKPLVtDGI7ANClm2FdUu09ROkxy8+CGe51NS36/mrl9ePzybz
	RBBRbFHaZE6oRCj23YQ6a+nPfK0kXAoeRcAv1OUsR2UcA2LHx0aale77Hp0eg5IXh1jrWnmDho4
	=
X-Received: by 2002:a05:6e02:4503:b0:3dc:635b:6724 with SMTP id e9e14a558f8ab-3dc635b68aamr48847235ab.10.1747652497927;
        Mon, 19 May 2025 04:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIo93Ctw8RMLn2/Q9we0cDjAuETBrcair7HSgGdmyDSyuXUvh0S6+dTmbsrmUeaGWzk1JYWA==
X-Received: by 2002:a05:6e02:4503:b0:3dc:635b:6724 with SMTP id e9e14a558f8ab-3dc635b68aamr48846915ab.10.1747652497479;
        Mon, 19 May 2025 04:01:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b908dsm18641871fa.72.2025.05.19.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:01:36 -0700 (PDT)
Date: Mon, 19 May 2025 14:01:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Message-ID: <6ysyyj7sn2isoddooj5y5evuayplwd7pzayepnij4ioi7hx2o3@43wd4fd4uaha>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
 <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
 <14091125-20f4-405d-8022-f02ac3c311b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14091125-20f4-405d-8022-f02ac3c311b9@quicinc.com>
X-Proofpoint-GUID: bMC_EyeReYp45xI_bTXRXLQDOuBy_g5x
X-Proofpoint-ORIG-GUID: bMC_EyeReYp45xI_bTXRXLQDOuBy_g5x
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b0f93 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UVS_QiJXTVoWLX6X8-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX+dyh4Pr1AUKA
 ijLRgeeJhpHaZe1+rlI2FfvgVsJSd43PPfUSu3q153HPetHL65XH0WcEQpA5G30MllMKEu3uKdH
 GwKyM2+GCKGkQWe9FWf6UoZo/XNjFSohv+IqN0QMqSLaYzCNVBsBK+xUvfzjS7kocF8zr6zS8fv
 /EJ05VWtA7uMOt5mnU+rHPySDvAi9guLsO1WGecVnTAYhEGgd427l40gMaeh2S+L2Y32CuxeKvf
 HlZFlkfSlTBSAjSk69Wsb04d3apHdnMBnXD59WoMaYx5FWqJ/yOvAgwMSNQ3YSY5So7ZH2OqWhX
 Om0sjIBCY2hctVqiqigPP7cUnX9u+aj378+2aPiyA/wHG99xw32LgUO2Tz+8Z8EdKw95FSBq0xg
 lstDLEsxCeBUORZmALCCnEcNkXXBN0C75FVyDgbOh5OEeLYHIVBUKcrGbhnb4MzCAZ0Twm7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=943 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103

On Mon, May 19, 2025 at 03:12:39PM +0800, Lijuan Gao wrote:
> 
> 
> 在 5/18/2025 12:59 AM, Konrad Dybcio 写道:
> > On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
> > > On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
> > > > Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> > > > remoteproc functionality.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 86 insertions(+)
> > > 
> > > Is the MPSS not present on the QCS615? It was a part of the SM6150
> > > design.
> > 
> > Hmm.. good point..
> > 
> > It's surely not there on QC*S*
> > 
> > it is there on SM6150 though, quite obviously
> > 
> > downstream ref:
> > 
> > https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi
> > 
> > Konrad
> 
> Hi Konrad and Dmitry,
> 
> I have confirmed with the relavant folks, and this variant of the QCS615
> does not support modem.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

