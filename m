Return-Path: <linux-arm-msm+bounces-65619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C100EB09F86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BEAB1C464F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA6229898C;
	Fri, 18 Jul 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yryr+SyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A129827E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830794; cv=none; b=SZLntOI44znS0h3OpJemG1ERzHvCG4HbLIICQPpjnSF0GlTYMbohAScIrycpft8+MuaVmDmrTSZVsQi+trQC2/MJs7awIpEhTTzGkU4Uq7U/Mxq7lODkijQZ2KHWuPl5UpS9SACKRIZE8Ma3YRLMeq36PmpFfmS9Ss5Y2QGP66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830794; c=relaxed/simple;
	bh=smS1OUgSzyUIU0rtJExIYiq4cV0O0jPRf2zTTzbUCgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4FHboA4ORGesIjvgie1xNYbqIam9CVA7XCO7XD9gc+CtKKFwf8wFKtJZ2N8F2Yqzsw4K6B3Mx5HCrtnABBNq/HDx0lDLQDGNOHmkgD7PcWH9WReYxbmDISnzutVfRuTY0sUcxb26+T/5gTwWynWlOfMhVj66hwLE6JJXYeaEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yryr+SyN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I1knHZ015953
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COoiyLtsPRDlOGmj2f0fDl3bkCfHbow0lzqZhkT/2HI=; b=Yryr+SyNF7Y/9D6S
	6gMKQsrrWdxVdG9IfnBC90Cuhc4tplEXzE2U5NoRa0Q0bKVYrwTFjJsemNOwpOxv
	pepm0F9PyOfLeyd0ROf5CQtFNKgbiLQ9i3R5DmkW4buhAVgaa/jK/SYVtSImjvUi
	cavRR87EQ5uM8Ib1y/uZrTsWbHyF5ZJiqDoaIi4ABya6ABVNF8FNCXoTqhQDSkpY
	3/3S+7nLe004t5+MsDz1y5ES+5cLJ700NOjTPKJhTeM78YJl9xFNt3i7oCEjMT8i
	zvKrlmzfod5L+8ieBSd+XP4GGWf215q2MhtcFdmwgABlji77IcT80Uw85A1dtRlb
	05akZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2tdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:26:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso254680285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830784; x=1753435584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COoiyLtsPRDlOGmj2f0fDl3bkCfHbow0lzqZhkT/2HI=;
        b=tC5KJzSKCcS5Z3ZPa8+AQlD/hcC684CktIITeIb4PJhP2FeL5/qp1ULvCla20JvnFV
         Vk/6nko68wlefIhPIdeSNEi66l47KqAQufeJ48YzeGmobyxYRHYAok6IeKKrv43pavcW
         caL2FLQrtwEAwwuPFMt/StB37Ll+D233v5Gmxl9jKnqpOM22BbUgf8+C8To1aGs0ZfVQ
         3GRbbRg+tSma/FjX/tQ0982oz3759DZwILEtxBSjKHQCgk0kOlF11lDaem3udg6/zvUj
         wLmwW6N/z8dIaNDNR/xIAfdgHMgrQ8t1OB6X6U9xJpoPuaObcgEt7COdzWdv406zU4zG
         JMqA==
X-Forwarded-Encrypted: i=1; AJvYcCVGj/zNdWAKZRAKlUU0BQZMbh7qOCKVTe8a8sPj27njCQEQZxCNGoqYq2a0/DvzLVjrCZtz0Tv1kwwiK1Eq@vger.kernel.org
X-Gm-Message-State: AOJu0YzuepPwJ7+46ND74Nvnqb9fgnuBy8Pa8WNTPiyNAXW8NGScyB/h
	Ml2IqD/FXodfTJ1Vx5IdQarHZRJvbEFHD7vfpFzlFZ062yBpgBavilBka7EPb6PC79LS1O/WU/f
	i2dVCUnWasVTeoVSv0euwizJl7E16ati6bI1veLeUdQssWRQgpTfcR6+YbK2bp+B9UC6/
X-Gm-Gg: ASbGncvzpvuUH2k3ZJjbfZFDcffB4fraTZ+xrWwYuRl/FDEWqzoD/hu4bmDtK6bKdIf
	7fyhHENsr9bVeibwiCxvDqW3z025PqHsgh63LZwny8L8xCt98Xa/m88BC9go/l/XY8Dur8Z/PRH
	5j3VAsye+mdbTmBeFYvbwyZdIUd4QLk39Cm3h8/IrKmKbhZYAue0uuYo6diTTFOQJA7kIhyxe6S
	BNFaRjTgShMx9UN8n1T1r7vqb6g+SZxYXHVFO0Z18UDQywKru/oxzvkeHVR6iPdI+WhfKuIr+h2
	T13RgnmYQSEda6j/EcavSP2i9rVgnHT+Af+0c4JHZSPXfQD/VvkoPiRi15APxW/ugVYimUgiDr5
	udF+CCj7w6ecjM0/lTT6ZmfKCMzmipLkJAGpdjVVEtPeVHsmOdtmz
X-Received: by 2002:a05:620a:6904:b0:7e3:430c:5e0e with SMTP id af79cd13be357-7e3430c62femr877497785a.18.1752830784341;
        Fri, 18 Jul 2025 02:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ULvdLv8+JBhbfjsjnyFteMc4V0YqUWrlV8q9vEs/1OYuftM9PI5a+ZhXXON7UyumHdQcLQ==
X-Received: by 2002:a05:620a:6904:b0:7e3:430c:5e0e with SMTP id af79cd13be357-7e3430c62femr877495585a.18.1752830783799;
        Fri, 18 Jul 2025 02:26:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9bb43sm186031e87.32.2025.07.18.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:26:22 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:26:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <rsybfhs6bb46putaytvp4tikauvhynhsam6aufxaflo6vkvzwh@qrh7sm3g7i73>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <b4nxjsx4fu4xmookpxukumw36wlcpzelh6axjucqe4lyswptm4@kczsldalq53n>
 <822af9fe-5db0-4620-8f08-9232c608d443@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <822af9fe-5db0-4620-8f08-9232c608d443@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a1341 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H507J6Sm5dMqOWlkyu0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1GvAbBYUJXMUg2pgF1XyGoX9W3bkIdy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3NCBTYWx0ZWRfX31vbQNoOBd/A
 cYUDjBDiR98ijEkD+DjOMNrvrGOt4auQdsEwyYnmScqlL+pso64bg08a5EKfq7GeDmNj6PC7bPc
 XDn6o00gbpOMK5RLg5cmUNF29nCfm+IKTzoEkhFhSeyUoZbcwATcaJ7duxgrGPW0lgNttii94TX
 QbOsc7ST4hRiPNB/8dQEdQF1QnH4fUzDoFngQzR8sPs3W4QhzLXP77f9ONRwdsm2F+ZnY04npi1
 0cXtPJKxxxcGQSY+yutPuJNBTDYqLaeaigqP0RWwAtvdzN9Qle5TKHm2QboQr8xtCFSw/960u+z
 YYFFA+GVK21yA1XGC7VHBZ2bGCg7EWnCMs6btZXP03YLcfnEqFS1piSHbVm48iDI44GSl+w18N4
 uCgW3PLXX3RhHQtHnV0D7mRgQJObjmXYzNvWPTxO94RC5+Q4efnn4G2bowv3TGpzlePsB9r8
X-Proofpoint-GUID: 1GvAbBYUJXMUg2pgF1XyGoX9W3bkIdy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180074

On Fri, Jul 18, 2025 at 02:33:50PM +0800, Yijie Yang wrote:
> 
> 
> On 2025-07-18 02:52, Dmitry Baryshkov wrote:
> > On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
> > > The HAMOA-IOT-SOM is a compact computing module that integrates a System
> > > on Chip (SoC) — specifically the x1e80100 — along with essential
> > > components optimized for IoT applications. It is designed to be mounted on
> > > carrier boards, enabling the development of complete embedded systems.
> > > 
> > > This change enables and overlays the following components:
> > > - Regulators on the SOM
> > > - Reserved memory regions
> > > - PCIe6a and its PHY
> > > - PCIe4 and its PHY
> > > - USB0 through USB6 and their PHYs
> > > - ADSP, CDSP
> > > - WLAN, Bluetooth (M.2 interface)
> > > 
> > > Written with contributions from Yingying Tang (added PCIe4 and its PHY to
> > > enable WLAN).
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 607 ++++++++++++++++++++++++++++
> > >   1 file changed, 607 insertions(+)
> > > 
> > 
> > > +&remoteproc_adsp {
> > > +	firmware-name = "qcom/hamoa-iot/adsp.mbn",
> > > +			"qcom/hamoa-iot/adsp_dtb.mbn";
> > 
> > Is there a significant difference qcom/x1e80100/adsp.mbn ? If not, can
> > we use that firmware?
> 
> I believe there are differences in firmware between it and the EVK, even if
> they’re minor. Therefore, it's better to maintain a dedicated folder for
> each board and move the code to the carrier board.

Then it's not a 'hamoa-iot'. It should be 'qcom/hamoa/iot-board-name'.
Please submit the firmware to linux-firmware and also move existing
x1e80100 firmware to the 'hamoa' subdir, maintaining the compatibility
x1e80100 -> hamoa symlink.

> 
> > 
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&remoteproc_cdsp {
> > > +	firmware-name = "qcom/hamoa-iot/cdsp.mbn",
> > > +			"qcom/hamoa-iot/cdsp_dtb.mbn";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

