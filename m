Return-Path: <linux-arm-msm+bounces-79826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0DC23F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 833814EBACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618A932BF48;
	Fri, 31 Oct 2025 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djn2CHHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfpmAuOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77B32AACC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901031; cv=none; b=roHJCzr3aFKlS+cY3dNFxe5WhbVTt9xnhaYfl4YEJbuqHQyD8h96dijjLQV8PfBrIZcnj++Cz0jSA6jfshIC1G4BRGIYKsgxxRoszEGot6xRvxhIHRdePxGpShOMWAe86RofslaJtqAajWRynCWc2F4cRK8OZt8vd7DWflpUTr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901031; c=relaxed/simple;
	bh=yQ1jDNw6nw/+w3jdr16Cul8rj5akl3On7MjQTMOOtI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I53NVKpDOzXgN4/2oS9yluRiA6RMzw+Tys9/IiTw60+R4rkUOt4kKXxT6S7lot3R2l1VDaDV8m7HjoMUzElJ/UX2ZmoMf/3jWLB23DUbm4NdczONXrJ9DEnGj17eKh4AigaqlWbRsc64KB/XfrENn+50ZxyOnhcT5Ff8SPLytfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djn2CHHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfpmAuOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7Q8Ea3117567
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dBNJpoG7oA7MdXWziFc42uzkOgfkuUA/2lceCPcpVk=; b=djn2CHHIJKzpmj0Y
	LpiVxcrXYyyw/KJMCIqc88ykufILLr2MARmeI29XNVsoy7LlTdg8RydzTCmSNbgE
	/CMrooXFUx1SITNWAQyOrALUWt0N/2mWzznMZ9hFRsa79k+hfeJEuCJGBjgvFIeD
	9bRr4p8LbVfxe3V85zgVhD8Dy98NuM7oOK3vfw/po3o1zZri7bRx0eA/veWsuFJQ
	+4pzFwp5kdYik15r2IenYCl6bj2QZMvTLNRzF1akxHmBJ47Og8yb5eVhJRXo5Niy
	G+Z8TJfUwP5AcbRKrSV4qsBkWILUyuRIVPUtOT50Mpy1OrSu5zph4NuPeNE8/NBP
	Po42LQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frkgr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:57:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e890deecf6so3580861cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761901025; x=1762505825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dBNJpoG7oA7MdXWziFc42uzkOgfkuUA/2lceCPcpVk=;
        b=UfpmAuOwkDhWO19I6diqeirkUqOPECYuRZGgNEkXF4TdIUbUMtMf4OhIOKz83Y2iXg
         e/yTkqRv+e9vc2ACo2CF5qLcOXYVQKdT0LSJH6mtgrs+IElVuhH1gagTa0zTZ4j4oMLv
         J7wM/OGJRnhTCLGmOItR4GJQPTZhdkUfmI/zElUAkZ1WnDSKpzD7LmoFr70vRjh5yK3J
         w7KI6g1xZdGL9uyE5wjhIi9L+N1eW62jxKJE04MEOrHalS6qHNOVzdnVtzcOEB3JNQAn
         gBPIDazQQeX13Tamte7uIzuhU4VzOLv7xpxSSGQV1whjFv8iujTtoT28goPkcguhdHl+
         NI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901025; x=1762505825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dBNJpoG7oA7MdXWziFc42uzkOgfkuUA/2lceCPcpVk=;
        b=ob2s6RCqIe/Jg1Jc05SP9RviM2HcqHtZJAC4ZtuYdVL1mLNY0ahfsKVGfX/cOOT5Y/
         JctOH8TvN1YNPlPqJ11/Ja6iJ5D0jMkzw+Rds5X3oiYTXQUvajF3CJzrETId+BpaZgtx
         F7zTUv38X3WKIw69SxgjKq8sUFpx0/3oWb2rVv73kylsTcX3yHVdyfLQKmRXemlzOJMw
         fcnW3gPDqEjTv354udurirGXSCha/+/0nHC2mZMWhB9bPGzZWuwPo1Hcm5QI40JJG0eP
         MKFhLDJHXgJvcGVSodO7GdF3MFI7cAmnohs687jh1KGKmg8/DBPJeyT2xcOs90J8tZKQ
         0y2A==
X-Gm-Message-State: AOJu0YxJxyR7fskc8+aPH9ngb4irtIAKR5Ogw5Am4yXTNelpjIg4K6zS
	X46ntA0L82BU2TyjBjPLOHN1k9Cf51zgcxvQP7EA8N9uzsmEKE+y59PAe02pl+1fJDZv2z+09jy
	0MUnfBt7CrMWUDbPcqmQqDlZ1nD1GHypdqjvdBOPFAgBpPPt0WIU13pHEkCEJVg/VNm/h
X-Gm-Gg: ASbGncuJ8poLu7GWG/OiFNsEl89iJ7eQmVIAqtUwPEo5Pi7kDNHfiNbz3by83A4r7pb
	+Q/F0mfJjXBYp15ngYZSwVHtlJ8c6Z6wwZ3/aw7xkehFZDwrZ9xnAaidFa57C2jUjTfL+Ad8H+1
	97xbMmaGsqMZB1PBTExYtyCmEjCnsdLKxGc3D7/dNqrIswOcT/iQUD1PlI2etWVnt1Wy7a3PIzs
	YsxqibVXYLtgpWMQKqnYEghuWVPSXDa22A8RCT5U8R8Ma4dM+nh+um6ILgCwMzUTmMSX9v9XjCd
	bfoM3xs59DvcLLrxv/BpBUjSlC/RU3vpfEelH9ZwrWuIueANFKIWP5XdcyA3DGp1vCYHmCHsb3z
	uzdQvLBVJx0N/9N5oq1F34KQSUqXyWOLX3zJMjyT4RrcCu167qx/sHvxX
X-Received: by 2002:a05:622a:2cb:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed30db06fbmr20600401cf.5.1761901024835;
        Fri, 31 Oct 2025 01:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh6P0sdOosomYGx+CFxn2zJIvjMK1mpVwzKuR4xrxOpWGgcH0e1YP/0Jw2xV2c/IQ2wtaAtA==
X-Received: by 2002:a05:622a:2cb:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4ed30db06fbmr20600271cf.5.1761901024350;
        Fri, 31 Oct 2025 01:57:04 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975defsm121917366b.11.2025.10.31.01.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:57:03 -0700 (PDT)
Message-ID: <d9812a14-25be-425e-9b69-20eb998cc4c9@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:57:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: rename sc7280 to kodiak
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <20251030-rename-dts-2-v1-2-80c0b81c4d77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-2-80c0b81c4d77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=690479e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SCbu04D-vPvkWQ6b-rwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FjSYM6X2CQIfjoxQozUW-7CcI5cZmsF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MSBTYWx0ZWRfX5c3wK7CzUdcK
 MHvyzeESYau0fSitP97JfMYfaQ9i1G2WS8euew+RCvkPbX0zO0Rll3AbmM4JDEe/mY79ruJgs8g
 VHmkRVYCyPfPiMh4I5nPLFqr5/g686YT2RbLRUmUFgJzBqbTq5u4QFLDto3Tafudg8s0Ute0jMj
 BOpj/iFh9PNF5tbnTUJJzdidejrthGZylmosGdD4o6B1QvrRYytlp35Ni62HsT6ZRXWNN9qFq8K
 9q9Hc6BiQq/mFjFc8pKGF5GymVkVxCjw7kOUB+GJZRCrXp9KZVriF6VvCiA33afhZzsUenIQMnE
 i68e8l8K6Y64FPGxVL2pnJo7VETl0AWuUO/fW81RPXhAqlN5i5lNzn9TNGi1WZmocBdnKwo3huC
 00EyMdrEmmEOwwdBID/h4I6mL08eHw==
X-Proofpoint-GUID: FjSYM6X2CQIfjoxQozUW-7CcI5cZmsF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310081

On 10/30/25 7:20 PM, Dmitry Baryshkov wrote:
> SC7280, QCM6490 and QCS6490 are three names for the same die,
> collectively known as 'kodiak'. Follow the example of other platforms
> and rename SC7280 to kodiak.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

