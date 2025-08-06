Return-Path: <linux-arm-msm+bounces-67872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F423B1C388
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63441186675
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BCE28A406;
	Wed,  6 Aug 2025 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huTiya0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D6275B08
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473303; cv=none; b=QjmEmuKMj53+VHBq5P/WB+Vo8tTfSVGETfYW7NV8gHjtz18nNxrtU6LqGPgH4Hx8wxjW+s3vwZEPU7woDXQau44A56UUc7BUOEm1z0V7zIJu8oO+i4t8OBsekv2uTsf8CyYEHpUE8VP6Ak39hFkBL0wtA7rsssuWRvKwsU/yNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473303; c=relaxed/simple;
	bh=pgv0yQkNz/DBClC/IvaptKaPbaQzzYBOnrzrNVwFKnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msKzKGgnBWcD1CCpIQuEMd/3y7A9N0TQnSpd4T9E28DxuanAXNgibrJPiTAkzAq45yXMi3rWTS2bcoVNN0IDNWXihMBCW/QTtTcmZDE5sRtNdUODFkaj4koNRc7tOTscgfIO4CjX5z+r3kMo13iSIM55eB+5zMdhoT6bojiP2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huTiya0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FurT020908
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VakF4VB+aL+NaS1MnqeG+4TxHm+weWhZ7lip1w6QDk=; b=huTiya0X94aXfKGs
	P5deAgB+8aDXBQ8MSQLYApgbol2kiwjgdDqxq/R6KQIVl+a6Vo80w9YWE9nu+bg+
	47objIpX+U4R4fBiSCVgz16uf0wEb0zKikT+eZoY7sBhkHqlQZmUruEvKopWIUl4
	hygomckaxoPnDh9L0A8OlqwKDnnTmrTkaCCp0qjIdLtUuAyWCS/EknqVCn7i47Ke
	q8LHW2mvDXg8JqPojNE4Ytfh3pOi0ubsD6TzBOO+6rXH2xIGEWduRDIJVK3wgptg
	Na31JYnDJUAzM8XaLDWuOHh5u2d0dphm0mDWVA39BLMRixlDyl1be9QUPuh3JNqJ
	uygLuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1a9pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:41:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073674bc2aso19577516d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473297; x=1755078097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VakF4VB+aL+NaS1MnqeG+4TxHm+weWhZ7lip1w6QDk=;
        b=QLNHEoVXPXkaQPPse2rAC66vovMtPujPB/UpA81pqVzYdXljNyl8Vgvs7ferkQHmHh
         p0hXZuEVcU4gSAuGHeR7oBhl7zIwEwNLPGGthMb7bFJghQ7HqPjyjc++r8X1iFOukKM+
         Er98ZCJYKN/tOIE4AMWvqUMNsiSmkDHC8vzHtI1BiBODk4DOe2YjxyECWGAwxj0fy9gZ
         N+9qH1Bp+9/uxdN/+lwjO8CNXBjzFZUu8kFPIoJuTXebuZTGueBjJF8/ZVvovy+jrVYF
         SS5h9ZOfeKfk8/3ZbuGe4DsQ5zqpmljfPy6qZ+1D5lN0NZbS3D26CSfJAOTQLwLw/6it
         +b6Q==
X-Gm-Message-State: AOJu0YxAk8cS/CqkXpHabG65Lt+4DrcYdkQxru3EntDIOgAUXZTm5Da1
	jEEoK4dlYZd+u549r+LOom7A033eoxJ5tgZK8qnmjDIWLaCQ4tgRMPQ9VkFIwilqpfaUF6WIUDC
	hzzGb0G1rcr7MSI/EQ8Wi1cLCPqoQO6BNGPkxqZM/0/yQwfQXlYkdjuiRLsgeqKaQjN6g
X-Gm-Gg: ASbGnctdCu+zSvf00lMmGlVVRzczrfeYWkBgJZW/gPm5VIwU2njFVTXptH+Hcla31Cg
	q/dmiktuIBwmpaDGHUqX0aVjIuirWH8jzXlWtJhHdXuSYBWiVs6Q9plYyzggkUJdtTlA2bb1491
	ggiFDQ1Nrta52ioSNA+lqS7X7sSstNp6zGkuJ0SXvrf+rhI+bA9hB0GMukpk+8JeNULhGU+czhN
	hidlYb99oEQHl1mIxfp8Twut8NLui+dm6aDJzJx7s4WCvod7lIJkTGH3KqZ7fIXdqYUi0eO2aJm
	m5rcna6rzFh/ZIs7NBf7flPu/27tkD5E49yAdnisg65YB1F8HJBbTMPdxmw4keY33ggO9q3q390
	XP1rxlAGh3jGgDc2OHw==
X-Received: by 2002:a05:6214:226f:b0:707:40d4:44e1 with SMTP id 6a1803df08f44-70979352168mr17998126d6.0.1754473296857;
        Wed, 06 Aug 2025 02:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnpjpBA0gv0Qyb9rFEQ373wlImQP3wj+mzhJoMbEtEK39NrrxF/4L/FOwxD6DmpkrQ47JJFw==
X-Received: by 2002:a05:6214:226f:b0:707:40d4:44e1 with SMTP id 6a1803df08f44-70979352168mr17997986d6.0.1754473296303;
        Wed, 06 Aug 2025 02:41:36 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7c88sm9857004a12.41.2025.08.06.02.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:41:35 -0700 (PDT)
Message-ID: <55e9cac5-3803-40b1-8431-52510a8932fe@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 11:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>
 <20250806-dts_qcs8300-v5-1-60c554ec3974@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806-dts_qcs8300-v5-1-60c554ec3974@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX72OlOEJH8a9h
 jIOftm2XB1APcD8zKF/kOadHbG7/UbKyS5FcsFoLQe+oUkurdE1rXOWKJfkgMUtjKRI+Io9q4A0
 AX97HEfRzleCz1voqnqlqXCd27YAfe4PMJyTMk9Ghjb+3uk6eb3u4pyrSUpFe+x9oxit9hD5Fq2
 fgINKO7sU0C9SCSjApdYJSO2qct/c8CkSXo5zKcj/YIo5sutOgMiCco8GZiZ8Y3wfDbAocbS2hm
 xUekrC9RiBaXul6PD6HB4JD2cE5CaAtmM5jQSKwH60TwfAJPGMdXFhasRyyj6OHd/vRuPUq9Las
 p4UXeps8QD8nsVD8JKZQsQCzgZI6ktssZt5sskxaadTdHhRP3DHGf087uSYAToG3jGi/wfHIwqL
 Zzx1Ui2n
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68932351 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ggSMAipNaOlLgWN-UjYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VcYea6iv0q5-_U35BYC-69v8G8B5B7g2
X-Proofpoint-GUID: VcYea6iv0q5-_U35BYC-69v8G8B5B7g2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 9:12 AM, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

