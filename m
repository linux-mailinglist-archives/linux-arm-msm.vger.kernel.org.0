Return-Path: <linux-arm-msm+bounces-82826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A79C78E37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 98DDC319A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A455034CFD5;
	Fri, 21 Nov 2025 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WouJtQuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxWvChvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E21B4244
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725087; cv=none; b=JX60+PFcZorBoJJ/HsEQnSFbP/qDKIIZLI+EpWAnWlDy93hXFs5H+3SuOMiw+w6qJ3JePldMBAAtS2b+15TRYrQxVmKY4lpzXTxoasPAZIRiXTkAshl+ROqz5RezolTzhzVWesmPmpxy17Cp8j9PWBbMoVADYM4K0ZfpUzSD+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725087; c=relaxed/simple;
	bh=Gi4kobpkwga9/16UY5mc365JaABLwTPgBYBDavoEnvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eR/ix+tF7fSVtu2/jvciOYx+7CQVEqsdT2zEBEnjs1OT++etucvg16/Kfsk49NfUquUHbFfsZBZMb6N4Hkdh2jMlXbse/qk9Sj8pHbWxIp1Yitj6EQOjS3/O7TOEiGx5O3PDr0Sm0tlVmM0oSc3TqWGes55ojXjKhWoW8+Dmuj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WouJtQuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxWvChvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6anT71637464
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LX5fbE4RKa5v96YCl5FP9Vpp9OKbDp/evMuJ2k4vpP8=; b=WouJtQuYTBV6B3ga
	4Jv4Ib8FQGp//J3Q3jyxow6coiTtWKRGiN6hISZP/KzjlOr9wQWcDSsJUpzSOjjs
	7J3DMx6zwXqbKS8AJZ7gK2EFmd/kqrDLFbNO2CDPHLFEVZo1lVrEubbMt9hQFf1R
	i2EwOjGqxXFXIn0Nvwq/M1fkZO8g01tQEGwcs3dlJufiVJbIOup+IoPmSS3cDdwh
	Dhp+meXTCuQ6HkLdE6qVfPNYG/NYcz4qR69SzA7PACJSJLPh0i2QySth8VpAlYKp
	0jrl4HhhQ4HLOthbwxB/8xJ3UYFQG1Y2stMrWWEoXtj6J10K0Of1a05qLwiiDwRt
	AnBnIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagatdwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:37:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f587dc2eso48490595ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763725079; x=1764329879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LX5fbE4RKa5v96YCl5FP9Vpp9OKbDp/evMuJ2k4vpP8=;
        b=VxWvChvGwBOE4hHQ31chsFAIUTWTd+km4GPf/TIWDp3TyaCoMknArnvk3jPixEEpZ6
         YhLfFdCO5Mmn25BnHVjpmIs8kk1FyZC/wlgaGgqO69JhKPR9oJeSa4RNxsdVerrkCxhJ
         fkEgl9W/clVtcMhyd45Ht3FAfJpDuXiPeySScLqXKpZN3XF6Nb4jwCnszXnTubfWQcqD
         62rBycw6clKsZMwT0FR0rJMKddouhllpAe6+u6XofYEK7YcCIR9G2XxZRoTFypwnDT3F
         rSMav+fDIIc/5lMEqtEB7yWsmJ0oqrO7fJhknaRb/12f/qtclujOn8qSJPd1DH2aeaBR
         sc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725079; x=1764329879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LX5fbE4RKa5v96YCl5FP9Vpp9OKbDp/evMuJ2k4vpP8=;
        b=n7Wm4Wb2gVQc6O/o0Ekl00D0dodygVdgIcLnnnJtifgKbQR87/WS6vy/bQViHcnEXq
         k7+mRBfxffHkDtGTR719uy5lY/psRoPlD/kk3rWom6ICmMZjtC1nzzb/ECiC02oLJir2
         Qrk0mk8KZKFaPF6yR6d4VDE8UK4WQqT4vw9MSsgd+IRNmmy9eTP6n014LiCo/kJ4Zo4s
         nF+wtraq2RPf/23xVHAIWqsvz1+1+7vp2sv2Jan1Xh69Q2EqruHO6STunJWhiWmzpHMC
         /1+mDEWLJPL4Ykqw4QXI8t4EZigw9g1ixzwrNfTA1j2jTD9t1l7JlIYvT3N3jFF28HXZ
         zHqw==
X-Forwarded-Encrypted: i=1; AJvYcCWRx/yOwIYNzaUE92mAC0dR7MvnB/5QML//rSFkv/wGcpZL6T67pgM83+vSoSM65IppbjR4EnvdiWC+AvTs@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAeuUSC9BL4agrXw/FFQcyAfw7gi5UQnmMYXZUTXraPvoECKE
	8TGq4KPM0RubCqEEOv/0Zn1O8zCnUEB78La2U0ZW/PldvfpP5xlKeqe5n6XyMRpihCCNwZ28USX
	KdpnfU8YmF7s9w9N++UKtgOxuf3cxr9WT7GWFbKeQkO0iScq7hV+m/zRse/kUHX29d+uO
X-Gm-Gg: ASbGncvo8tPDH+LH9/y4UxGgdl1a+yCqcyTquR4HnnbxDaRtY9x3hdm/khTOkA7y4FC
	aIH7zfJAb6cs1dByLjkQMOkfbjiiBFeM8wnv09pA1/eb6TGPrgR/zJCyh2XC4HJc3SRRqzXX67Z
	y3BYSiXecRHTcq72ZAwUlMW8kvCpYc5vjlTBoYLWcSM2Wun2zmVtVmqy6vCRlv+mRGhZ65f15oA
	3xfwPoR6mn1AcEwZDD9vaWmszNGhbLE92S5WApq4/dRBtIPOKAzb6PDD2nMDI3s27h/q5BDGRge
	99tYocERUtL0wn7FM+bViVZf71qBkjmZunzf4guvI62jzPY0gCKnhUNNf13C7AuhwaSRdQIoYZB
	+nmRh9AK2Ukgd0NnjlVGdKBNoMPhy3GPm1pJZ
X-Received: by 2002:a17:903:2f4b:b0:27e:ec72:f67 with SMTP id d9443c01a7336-29b6be8be02mr29670215ad.6.1763725078635;
        Fri, 21 Nov 2025 03:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEox/O6hS9rEQ4q4Lb8Hd6ednxT8bkbtbfcLvPHJwk1j7GNteOLn28BBD/MnA+dBr4jzICZmA==
X-Received: by 2002:a17:903:2f4b:b0:27e:ec72:f67 with SMTP id d9443c01a7336-29b6be8be02mr29669785ad.6.1763725077842;
        Fri, 21 Nov 2025 03:37:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b273b06sm54460095ad.74.2025.11.21.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:37:57 -0800 (PST)
Date: Fri, 21 Nov 2025 17:07:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=69204f17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HW3qntPLjzzc62cy6IQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4OCBTYWx0ZWRfX1bIzIA2wICjH
 +rTG1mWQPS4CnBbG6LZrtybGNiL/xH+ALjcDKmvVD0Xro1xpw6LcbPHwBN0omWd2PC5xtvXtbk4
 EtNLvb6GBOLF+LTBRFb3/FrANwLGH8sr4ar9bOm6hv/qzGDw/1lVC6lJwYg4sSIlkr4YX3fEAOi
 bdz+qHcY92dKwYQOveU8ULKtBG0glQ/3Elh1T/apH3v2nZ9cfOMV8NMadMwK9OePBhjsd1pr7+e
 4vqJcmyvi9xuUYWwj0JeaCEDjFxwsAOK+n6opXYMkRfsW0c8xvvLd5IWvTw5AKIorVh6VyI0OqW
 rdPYQE0QftGq6GsR9dm/lJOXQmoccbtSo5jiyjoVqRsxCSzggHRZGS2+sSa5f9ZJSUhROmGvcZc
 7eKvEqhDZTPtN0i7yiF2XouhH1p7Ow==
X-Proofpoint-ORIG-GUID: OEtqXjBUqs98c3ZMOeO-vOUCpSacHA6i
X-Proofpoint-GUID: OEtqXjBUqs98c3ZMOeO-vOUCpSacHA6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210088

On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
> On 21/11/2025 11:01, Mukesh Ojha wrote:
> > In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> > related to Secure PAS remoteproc enablement when Linux is running at EL2
> > for Qualcomm SoCs.
> > 
> > [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > 
> > Below, is the summary of the discussion.
> > 
> > Qualcomm is working to enable remote processors on the SA8775p SoC with
> > a Linux host running at EL2. In doing so, it has encountered several
> > challenges related to how the remoteproc framework is handled when Linux
> > runs at EL1.
> > 
> > One of the main challenges arises from differences in how IOMMU
> > translation is currently managed on SoCs running the Qualcomm EL2
> > hypervisor (QHEE), where IOMMU translation for any device is entirely
> > owned by the hypervisor. Additionally, the firmware for remote
> > processors does not contain a resource table, which would typically
> > include the necessary IOMMU configuration settings.
> > 
> > Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> > Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> > authenticate and reset remote processors via a single SMC call,
> > _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> > TZ for authentication. Once authentication is complete, the call returns
> > to QHEE, which sets up the IOMMU translation scheme for the remote
> > processors and subsequently brings them out of reset. The design of the
> > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > is not permitted to configure IOMMU translation for remote processors,
> > and only a single-stage translation is configured.
> > 
> > To make the remote processor bring-up (PAS) sequence
> > hypervisor-independent, the auth_and_reset SMC call is now handled
> > entirely by TZ. However, the issue of IOMMU configuration remains
> > unresolved, for example a scenario, when KVM host at EL2 has no
> > knowledge of the remote processors’ IOMMU settings.  This is being
> > addressed by overlaying the IOMMU properties when the SoC runs a Linux
> > host at EL2. SMC call is being provided from the TrustZone firmware to
> > retrieve the resource table for a given subsystem.
> > 
> > There are also remote processors such as those for video, camera, and
> > graphics that do not use the remoteproc framework to manage their
> > lifecycle. Instead, they rely on the Qualcomm PAS service to
> > authenticate their firmware. These processors also need to be brought
> > out of reset when Linux is running at EL2. The client drivers for these
> > processors use the MDT loader function to load and authenticate
> > firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> > to retrieve the resource table, create a shared memory bridge
> > (shmbridge), and map the resources before bringing the processors out of
> > reset.
> > 
> > It is based on next-20251120 and tested on SA8775p which is now called
> > Lemans IOT platform and does not addresses DMA problem discussed at
> > [1] which is future scope of the series.
> > 
> > Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
> >   - Addressed suggestion from Stephen which was regarding commit message(9/14),
> >     debug log(12/14) suggestion, and return type change(4/14).
> >   - Added R-b tag on 10/14 .
> Sorry.
> 
> Did we actually come up with a cogent reason to omit the video firmware
> loading here ?
> 
> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> getting video stuff done and storing up trouble.
> 
> What exactly is the blockage - is it something you want help with ?

I replied to you here[1] and given my reason..till something concluded on
"multi-cell IOMMU[2]", I can not add video and block what is working
already.

[1]
https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/

[2]
https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

> 
> ---
> bod

-- 
-Mukesh Ojha

