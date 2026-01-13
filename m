Return-Path: <linux-arm-msm+bounces-88781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2AD19011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 902DE300CB69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4998C38FEF8;
	Tue, 13 Jan 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUOwiqaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhSI5bVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320938FEEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309479; cv=none; b=sETeBZBvmyz20uA+7M28xFo0JLcZ5AKoKsa2UNV+wyMIT70pSEvWbpS0k+G/hUWhDSmMv9xkLIx2n3WTqzwRYdUPdhu4OQJkfsGtxGJCorydTYgwQSp4HjEhY1hM9EVNq25UxZ/3pNERNfEMgxvdgcg6KVdpGanX9JdYDPhUIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309479; c=relaxed/simple;
	bh=f1smv8y9rYnHFcqj5jCfR+O+3u96mNBPMUNJqZeNiOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6baKaWDm1duGht7tlxbEQYNTGd76iYeRWcqnZ7SLRVkv7Z9O3EEMAA/e66BGRLYsgMP3aoRi7/kqirORsTLydkRP3mRJYE5R4WQq2W5ZkOPh9PWBcl+l3Kw99NlYT5YzeooCj64T0+njMD+KU7caDgWo/v6bgI84DUQ84IZYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUOwiqaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhSI5bVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8YvVP3727092
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LrBsZObGco9NNSkqSndahBNl
	GYG6lpT3RWJ1IaZFwls=; b=lUOwiqaS8c/BRPD8rg7glwhP5sLXjAe2QS/iAfRE
	6Rz9cd7faEMGMaULOtXhQ0DvY53nAiBuDrt0zInxo0/oqK8jHbe0NBQemSSqr8U7
	lKr5i+nzgTi+aZV/I3POjWcilZ6hMaSwYkMDuyQ9lqxGiVSfy73iZrOtpVXU5/bA
	Uy6iPd92Id0ny6RC7kps0gGVIYIJfnZipRJq0umvj8yJS5RhKyvSBQ/L7QGIZ2dJ
	UBgwwN5k2KeQooO/5+OezHbtwiEfYatWirMNLWs1JLUBLHFiyLfSiu/M7tHt/tbo
	B5bwjXvWyycyQxOgXIQ6Gul+zQlu1Rz2zd6zn89Fh2iZZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu0vpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:04:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so196300065ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 05:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768309476; x=1768914276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LrBsZObGco9NNSkqSndahBNlGYG6lpT3RWJ1IaZFwls=;
        b=FhSI5bVzYLvDFWHdlbxdlmD+4dpT2PPXsG9FEcKoFSRD2Rhifxj0cgY/eH0/JC8/XO
         g0qjgvXoOUgfLoXzZA90QujqZWhV0cJDofePjqtk86rZOHZ8qIRcmH44TM9uHIMfMsOv
         6xeJG9JJA+LxOLtQNja27avDDJJ8e9HXJaA5/c6qnNe0FZ/SVylGwfRY3u8MCrR9f+jQ
         SXp8fNZPRBgcC4tQP0ZtpzooRVcbnQSy+WzmhVWq8LVIUpY2KP0FwnZgFMf/TJlgNOns
         7KtHJ45S5gpSfLCg2yiuzx3MdSedV7oVL/je5FW4iJCzzGThGkZ/FzhoSrLwS3fs/JQC
         yePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309476; x=1768914276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrBsZObGco9NNSkqSndahBNlGYG6lpT3RWJ1IaZFwls=;
        b=Rp/p6Z71lCqBHtvOxKkELOJVWsee+MHSRLz8pj4E1DwE7n7eZWsHRejsMXDaw0gAPY
         gP8c7D4yHeBpVIF88A2HMJmspoAPDE+h7R42mZEpdOdYVNJw5misDP0oKNQwH/5HdYMt
         We9H/MsWfxT7uZqXWsm43QRpAXt4/92tMDKktPC0P3rxGshW5lGSyZGwMjJHQeF+PknK
         nqORwnyzQMV2oY1LV/pP4bzrYQtRsSz9lN0SAwydvrdZdjGk3EvwXWsizMEwztYLriRc
         3fp80wVmYma7LhX7N4RGK4P/BXBznMlAW9h+ntrG6Otq/9dSPn5bpWByaz7xBzOHV28E
         f1tA==
X-Forwarded-Encrypted: i=1; AJvYcCUVQVf0OUnrlQafhFNJ2Hxqnig0/AGFsZcjFrNrq+BJ2Moq6t7yOfYkxDc3rqRGG/kUKlENpubMI1/F6fo0@vger.kernel.org
X-Gm-Message-State: AOJu0YwPmIEGuNVTD6AwSAvb1G7ZAjV8gFXtn7gr6PZPPMc8YQ+aXMeT
	9hcNytgYl4Q/5Av57eFxgrql20BcW2CwS5wRneoMFsmB1boHI2hcyhPSsoCYDesT/Yea7y7FtAO
	MWepVWfQztPc9XG0cvSiRsOCyh35aavnb7jbo7Sv/P0PT0ga8k/Nh5V/QKEcIJRD59zPs
X-Gm-Gg: AY/fxX6oDYjKELHv0t7pq5TsAV87Z1ZzqdIsGCDLhrRSgpqwwyQN42adeu32QSfl/e1
	Kf1a0m230WnJtXpJPC9pIsuQ6dgZMZOujXQjNtho0cQ1vzuYcof04Yw5WS6QJ5GhKi4vUC8jtV8
	oz74+OQUNis1PD+AVZXAFyP3vQDsFvyv4YJQ51Alu7VIQ64GgfiAm6mFuwuvdw18NbupFKHFqXR
	j+4PetD0gNheDpFuWO+1FLzkkF1+gW7uvaABTef6/PnJ6s2wrSTohyVKIABjM7vpHUPLYZF0GPB
	z8F8rfk0WsgIY7SgOc/3CFfbCahEZQj00hr6VEKjyqkmO9cp97xO2eyE2RrYkkr/t53B33IVBI+
	zKIG9NPkiA1bnfMhIXzqUiXhOpCWxx65o8KN0
X-Received: by 2002:a17:903:138d:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a3ee485087mr129935825ad.28.1768309476011;
        Tue, 13 Jan 2026 05:04:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpKvGzrZdXR5BWwgsLxpcnOulsUHWmcEnI6Ymv+Xl0EvB/JBQjr9f/Ye2wpymi4KJtZM5E8Q==
X-Received: by 2002:a17:903:138d:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a3ee485087mr129935575ad.28.1768309475307;
        Tue, 13 Jan 2026 05:04:35 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm201124835ad.9.2026.01.13.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:04:34 -0800 (PST)
Date: Tue, 13 Jan 2026 18:34:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register
 write
Message-ID: <20260113130428.n2kuo2d2tkoosws2@hu-mojha-hyd.qualcomm.com>
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
 <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com>
 <cca646c3-5e74-47cf-9dfa-49a888db0414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca646c3-5e74-47cf-9dfa-49a888db0414@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tu3yhO5-gc7KVcMirneaNUbNqjnnwOdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOSBTYWx0ZWRfX++ntCXpHahhb
 Ab+TGO8LeVkgD5g9S1N9kiFOHaA8MNjqs7P5Ec9aGEfE1uDdiAAhiRxUU0JoUlSlnhgJiwU6WMA
 IpOtIgy1DgocNgC7fIWV0pl4q5YhnroWtGINKT95rUKlAwNBdA16P6YtOC+Hk5BmtBvFSQNpkQ8
 i5mas0RTf2oXzK+YnRDj6VqqR+BpBie1cysxBtQnqfVvVfuJhOqjxGfUCF/YXbJ23DlcmNRDcEx
 AJbDfRVYvT6cUsXERmjzTdhOHqf7+1DESCgD8ca0inwBf+HRAiKW+MUuq4ugTwL+s/mGKkbjQ6O
 RCdjV3MuBi+iVdaqrC0e/ZIDuoqniZunI2+fHJMf9K/TKm86785uiRLASRa9yWyxTiIWrprcsNl
 fW7sghNel4YgoMQaI+FYdpzYCOsH8BRki4KZlUBHdcwf92Nn52afCTc61C+1ES9cOrnAHcODqFE
 mMI2dZuqgxO6hsL1y+A==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=696642e4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uypVyKnD2Y_mXFCH2p8A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tu3yhO5-gc7KVcMirneaNUbNqjnnwOdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130109

On Tue, Jan 13, 2026 at 10:20:58AM +0100, Konrad Dybcio wrote:
> On 1/13/26 10:16 AM, Konrad Dybcio wrote:
> > On 1/12/26 4:17 PM, Mukesh Ojha wrote:
> >> Enable download mode setting for sm8750 which can help collect
> >> ramdump for this SoC.
> >>
> >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >> ---
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Actually no, we have a mess to undo..
> 
> There's already this node:
> 
> tcsrcc: clock-controller@f204008 {
>         compatible = "qcom,sm8750-tcsr", "syscon";
>         reg = <0x0 0x0f204008 0x0 0x3004>;
> 
>         clocks = <&rpmhcc RPMH_CXO_CLK>;
> 
>         #clock-cells = <1>;
>         #reset-cells = <1>;
> };
> 
> That's located at the rear end of TLMM (someone had a funny idea to
> move registers around when designing this specific SoC)
> 
> Problem is, those registers aren't actually "TCSRCC", not even "TCSR"
> Physically, they belong to the TLMM register window (which starts at
> the base it promises under the TLMM node today and is 0xf0_0000-long.
> 
> What we should have done for a fairer representation is make TLMM a
> clock provider on this specific platform
> 
> qcom,sm8750-tcsr binds the tcsrcc driver, so we can't describe the
> actual TCSR (as in this patch).. we'll have to break something..
> 

+               syscon: syscon@1fc0000 {
+                       compatible = "syscon";
+                       reg = <0 0x01fc0000 0 0x30000>;
+               };


What about above ?


> Konrad

-- 
-Mukesh Ojha

