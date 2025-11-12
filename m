Return-Path: <linux-arm-msm+bounces-81371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F0C5191A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAE6C4EB20B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A852FD665;
	Wed, 12 Nov 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRdelMCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5w4l3zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5335CBDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941848; cv=none; b=dpvtEqyVkZtOsDs2h1ucCKyBPbUJubmCC7ofo8fSkXUoSKHA88WiRXDPy3O7h6lmMFEUHLijebi2aR2jBYd3bkJkoAHfcjBDdfNBGc24gkk3oWb8BC023hEu5AAyoZFAOhF0afRNyWZ/Rie2x9H69R8KBP1rdUj0dgb9Di1I4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941848; c=relaxed/simple;
	bh=f/uh7xMVxW56p6zWC3Gy7P+W5GuXMtMZmawcVdJ3TIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJwT7BTHfIde6+ywHMlpKB7SWvuaPgBHuJm87n4h2uadsliPvnONwEe65CZZoIIdO+R+yvXjC5E99uP1kVMim++wNhwHXpScQauiYQqpiSNlY1wdBKXgId5BCLVlh0SqfVkxK6b2m9fTxP3YWKpRvHTUhk316+fZ4uaz7ptSADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRdelMCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5w4l3zk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9fTws721958
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESOOWg8JEZjuFVpbTTjzjvm+h9Zxz/dEl8JzPniKi9o=; b=CRdelMCqVNjEradS
	Ob2EU8riVoS5Q86XLzCiEyXVvMOBAv6mH1zZsVhU5NhODAlmKxHxMezzbjfBnO2a
	0VYY/XWsk4lizbM55i0E5EPOfWqLBlQCsnjwYjSvuFLopudlt8dk7iMc56zGM0eK
	sDHsy67N3u51mOn3ozNbf7ntlQUPRJPG4BJmFTUCQT/gEbs4ZQRhOcpKd6gDcFjS
	yUYe+NuJ/1EOiG7CKJGFEYgwa711pWxH6T1OWG1lryFR9MqE8BCk6+catgcuy9AU
	swbqTcMrO803pDSbRGTgcjOer3jgfN+F5/M9JujJBR/kFJGP9StGUDT4mTDt1QuY
	9YpOnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1r45e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:04:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29f90f9fdso15792185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762941843; x=1763546643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESOOWg8JEZjuFVpbTTjzjvm+h9Zxz/dEl8JzPniKi9o=;
        b=e5w4l3zk6TB3gX0tcFD+QSObHHkpOvKRasF5FiwaKhPAM+tDOfcI4z4kARoIWgxzzJ
         6IDGGJUvzhbyrhXjejdMRqFTDxV/Pm0e+7uqSPXurjJHqr/tyDIFcOa5aEvL0XuaBzJi
         A5BOjpm1cS/4LbGmlvBW3ZeFe9AL6xfS+Rk83HNAGoakpsBwnEjuTVNtq142sJg/8/ju
         bh1sJYytDmpzZnwH0990JUtGEAaKVWHmbLvQVT3YXCFb/jzZh0og119LGHSrTcv/Rsm8
         Cq/AHbNGENqtj1imB6DXQnku+QLSpsPuYERZRtlqVoOtw1v3+GCMvzMDz3wJMtkOcQUE
         yHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941843; x=1763546643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESOOWg8JEZjuFVpbTTjzjvm+h9Zxz/dEl8JzPniKi9o=;
        b=Cn2x5EAmlI13TRHoEL+q4I1FJDjeOPCLOLk83cmWyR6OmIA68ABg4nBwCB2b5Q4Om+
         ziF1MkeRqeAem5afsfXGo+QRcI07FhR2khp91iHI+BSMdr1uLbye2jKCH3T79kITN07e
         kNfacdjQIui2YqIbKAm4oshhqzYZcJHFTq7DcPI/BNea1ad2d90wgn74qBr7Aen8DPXU
         2euLqYni6QI4oaXnU1R48+uLhw4tiD6MOnvTSof0CsTaqFhg71ynf0te2AgWtU4FEJoh
         21OVEYKDGXry60rh7CEFhtkGTt1eQ0bKO76hY4U0LJtOa1aGWD87OhvaQL1ZH/NHyZaZ
         RXvQ==
X-Gm-Message-State: AOJu0YyLX+169wskpnnWHHBbBNgNmQqdgoujsJ/rBn5eSm3AgzYffQpE
	b7Vfv1ctqNQ/gjs82Gwvsu0rUvDOMCnpOyC/XjRP90DGsuohZqdRZmZsR4QgD/GNZTH/XZ2knvS
	PTT1eCCURy71AEulw2wVf4P7d1tHfqpTXw1JFwL9N75TxS37NeSjtj1jKPwBBik99b++7
X-Gm-Gg: ASbGnct1ZtP2oSro2mzBHO7VqUSfjMMFznXrMkDm7ir0YMxOE/xYJBjf9RcqlAjrvvD
	xZWSN0/1HPszr9K5RXRGuzHbDRU0N1rYzwmZRksPiQ23aOc0wE/lgM4iq2kMUAqMqYiyHjDdlbx
	EEFVBAboZfDRR5vo/2gDirmdoQEgEY304edFDYRYrm9wmVFhbHq9YrmAKbokZFL29HTYaAdKLUL
	4AA5wwwzNEaTil40KrwFQLfIhtXmzMyaRdmlHg90YR7QB+fg/ZFCB97vzSY+rYvqbI1VkO6h9wi
	X25hpVIob+LM9G/acQEwidFcyVLpTZpHjDffcayGf/ql2hIqimIPwRi1jdqdUHjU48Z6CJwx4/o
	2yRGu83lVV1RekaCBK4x8nSNdEWPhB+0H0fPXeKL+vCDaih3YlKWiKLak
X-Received: by 2002:ac8:5856:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4eddbc95295mr20899781cf.3.1762939742854;
        Wed, 12 Nov 2025 01:29:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxXDkLREXGIGU0plkUZzQNFHAnbqVG9tKUgJHlDX4gOeECyx8+IjT5CefAqXJmbC4nZB6Eog==
X-Received: by 2002:ac8:5856:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4eddbc95295mr20899671cf.3.1762939742482;
        Wed, 12 Nov 2025 01:29:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d3c0sm1608794866b.36.2025.11.12.01.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:29:02 -0800 (PST)
Message-ID: <5f26380d-4e2f-4de9-bcb2-54ae78495165@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:28:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for
 sm8750 mtp board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
 <20251112071234.2570251-3-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112071234.2570251-3-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 68KTP-ScYwOPNKFVZC7gSyxXGrZrupf9
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=69145b94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=UtbPLzXqTwk2hxi6kqQA:9 a=QEXdDO2ut3YA:10 a=l-yEoJkE5-sA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 68KTP-ScYwOPNKFVZC7gSyxXGrZrupf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MCBTYWx0ZWRfX0BxAtZ7rMsOf
 4yuHCuw0mcRAO2l8su0hv7Ov6dqExR4Pn+ZScHUq08WiJF3e0Akcf57Ja1JKXxdJNF1+toHtao4
 AKmtg+5hMtcrb2NduIrN4vyO64SOepoWxiEUDugRzlRBZP88v3YO/Hp2MFa7/YLezVs22xuG4IT
 1ULO+pjcbaahioyIVytMqqBwzzRm2GQpC8wOOq6Z6OpfKzzXOCCz0RvmtvSjar3zkDUPg4xDbXr
 cYy7KwdQMu2R1kceeIVkHpMI7E6M44gghuH5X/cUtZiDTfQ1kGTcy1vlFxwr50sOqPMWqVzP2Pv
 xi87uooix1xcXCJhjcpBSEYfWz4tQYk6xJHrxcRcEGYYQd7kEbXZKyMrNu0kPMN/AdkUXdWVvyU
 ciugYqq/5T9aD/0wKfnpumFhUvl15w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120080

On 11/12/25 8:12 AM, Sarthak Garg wrote:
> Enable SD Card host controller for sm8750 mtp board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

