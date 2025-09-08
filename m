Return-Path: <linux-arm-msm+bounces-72529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A252B4874C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F8937A1AED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939FC2E3B08;
	Mon,  8 Sep 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7zy8PAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D01531C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320315; cv=none; b=SCGhqRs5AwV3TLmc4bpDO8NuutDK8TZMR9jpHBYNwaMeAyA80u9jr9yc0/dq+5a8HIW3SNmr4J1YYNCDrMBJNV5Ewa5eVWdGUfgudKX3zHk7tPsc2e9YflPPILzuozMyoFbE/y+mSLn6O5Pni/nCK3Twrbr/F7w5Nw3AJMQaP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320315; c=relaxed/simple;
	bh=AUQQo6irlE7E3ePC/FnCDrpVMGqKdlKU11iw8041iSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNokFIhTtuNT74JjOhgs+Lv0QEkkby4jDFZG1fM0r+as+QGhtVqoMh0vifz1L+6r63FvLMXTtW0SE5ttKVthycpoMywkgsyniERAAUY7mHMZF15sMwpmAFoqtW4sFMBzfKWMB52UeztkrDZV0idXNPPzVgumqYviUPLsdBMMlII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7zy8PAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lrbrm017315
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDj4s3a98eQH3kjfCKPvSCUrdn86VZnNX6R4VUENK8c=; b=U7zy8PAJSiUcRkoU
	gH/HMI+/sYg3Kxqx1pCMXol22dL8e2fYakoZYSQV4pjqRjQaj1y643dpgVbVdSsZ
	OKZRLE3bEOHjnRSvPdpBNZhHQtZ9V/Me4AcOJSrTn6ogLQDQmnPBZdGL/isHss35
	jaI4xlF8/UEZeA/QHlfL4bpETikEpF1pyUCu7NCy/4Z4PxIhNoDMHgYuJ+k/BR5M
	8k5ygoxn1C7Ot/KnlbjRsdpUtuO5C5V7i6JPidkRZYigPhxMhhxehuFDzaD+Vtgk
	+NdJIjllD5eK42nE0kPTt5KuEvQ43m8jF8B0vheSx0ivmOjy6cTu2Q1wXOFhuIuA
	rFHVjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kur8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:31:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b600d0a59bso9043361cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320312; x=1757925112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDj4s3a98eQH3kjfCKPvSCUrdn86VZnNX6R4VUENK8c=;
        b=W7DfGN4xwzTcxY7JKekKxycVCJl5UJPCpNhQT6QvrVGPHZK8iHK/lD8lhtkgx1Fptx
         QhxMhvwLQ+G1W4SQgojgesj9+CC4GUqd0q8POtbAQcHQgu5U+dP6W5HHwhxrVchAxeiG
         P+HyHfqvughm5VH+tSmOA/TCkOB//WtRDRTIQKhtynkO1vdm6bJ1XKkewj0T5OYBIpxf
         3Z38VWYG4CVDdenrpp0n2CQdHD433J/PyxHtF9Rp2N5PXFHcmfLsOjL5PQgy9JNAGavK
         02N+e4tsDwIhS5QsGoAXM9tcKOWFVvgJqPVQTD14VnX6C8MJhkcPo6KEzOzxnMLJyTHj
         ZgJg==
X-Gm-Message-State: AOJu0YweykbGEiNjOjOge61pARTXs+MOz68gU05zOBxiMNNwFHGX2hgX
	S/dw79MH4hb63IqI+9+pwlgINgfxk85GH0HlEWP3FdYEIESEaai4BOro6e+brv7/XqfgWlc/XaT
	Wi9kkuf9lUS9jbsdOfAtAJsVa5s7nibs2Yy/MpOy9942SOZlVWCgc40fZxrCN8L9v2D/l
X-Gm-Gg: ASbGncuYFNdfwa7sOymgijuNxec5Co2fUJQfhD9BKf3lhy9Ee6PrsNXBDHbg+LymsA/
	TkuAdEV8Y+/PLn+tFuttFE9LVigE704zncw3pcFPFeATSvnJhKgqw4qY8W1tmRgrK29ebjfF7e+
	8OnYUOX0Oj/EYcTJai30AmQZUNB9E6ttLMBcDFGhtEf3aTL8eULK4hikozCTNpc3ruD6ggI1Ovj
	B7AcpinDlWdMjqIN6xLwmlVzRgXG9ata+nV35PgpkLuALE4Osy6XQFC6jeS1hR4BXQnpma0B/zC
	EW3qNU3rv9QzhLWeQRX9mhatEjlwhcdjoW0JhsL6nXq2ew9hqQ0xSApYZVW+Kv/siuJSx96vJ5z
	Q+AidQ1CUemMxZsCB8Ggexw==
X-Received: by 2002:ac8:5acc:0:b0:4b3:474:503b with SMTP id d75a77b69052e-4b5f845df5amr53971051cf.12.1757320312283;
        Mon, 08 Sep 2025 01:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENfddQ3XkKBsMFx4ZOT6KiDbqO6YdDCzQfQfVOn7EvCvfbABtcsu0rhy8wmR139Hd8/r8kTg==
X-Received: by 2002:ac8:5acc:0:b0:4b3:474:503b with SMTP id d75a77b69052e-4b5f845df5amr53970981cf.12.1757320311763;
        Mon, 08 Sep 2025 01:31:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0426516668sm1906322566b.46.2025.09.08.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:31:51 -0700 (PDT)
Message-ID: <18c588b5-7b3e-4adb-bee3-8e7e445eb550@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: qcom: qmp-pcie: simplify AUX clock registration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
 <20250907-qcom-dp-phy-v1-3-46634a6a980b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-3-46634a6a980b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3nwZ8DRB2o59
 ZuINRcnUHkYQWIJ0LuJTX5LVeLDbC1A0KVGGXLJlxNSnwmiJcvtvWciGOQG6ofyfR7M4A0baB/M
 RhP3R5WJjUrhHO7k3cJZsuQThkjiSLrrR/B0+0Pv/j46QJOYiuk3LLghS8BRkIPn80CajxR91gu
 P7fw27vxnlCDE35EqWlVYvA0uQ0kRwsDgCQFwC5EUaCmE4r2vwlVDN19QzhnOCIFhmQr+G8pi3f
 ClMSPuQejIn4OMe79z1KZ6eS45vKovP7pMqtwSd3fd3/KgdEUuMb48c0do6HP1sETIqFZcSk17w
 /EUIARZCNg42AYZB5mT5e1M1giuE1Gxnsd3jQ2lwD1ncD+4qRUtELblf3qNZm99QFm+Fo35J6w9
 rUb4fpok
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be9479 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IMqhVVJ5aANQV6WWCkkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TP96RhF3ky0Wztoo6PYy3Dp5RzrfNSNy
X-Proofpoint-ORIG-GUID: TP96RhF3ky0Wztoo6PYy3Dp5RzrfNSNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/7/25 4:52 PM, Dmitry Baryshkov wrote:
> Instead of hand-coding it, use devm_clk_hw_register_fixed_rate() to
> register the PHY AUX clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

