Return-Path: <linux-arm-msm+bounces-35936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88119B0CA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4406D282A69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A3520EA30;
	Fri, 25 Oct 2024 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjOpwMyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151520EA29
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879620; cv=none; b=lUP1s86KghDulp2QDYJGVWplaQq57xTPPCib4nxZU6hjqaK6DtmpoTIZ+iW3oV+JeF+Ngu75AEq0zmWhmPXifke+lMoQIyMj9ripNxdD5UfANrb9xWXoDtb3QKRrLNmgCRhpTASBm3ySFuC0/SQd5hGK2js1WYM7NMiLfvDRhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879620; c=relaxed/simple;
	bh=O45/uWkitsqf5zqNB8GoVJ4NSW/gRSVWnY7ij0UaX+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=encvB2NHxAk1liiDJHVFKzAFld2qT6JPYodjd5ODIldNzUqbesZK6TxILC/gXKvUfpbhxNFoCpKYnu9zz/ntNsMzdwID0iBHfn2sjUHR5fldxVZ9iGbxebxok54DPauCgG8hzC181fMiHt5V72dnt+YDz6ixc8X/XkLXSZ3b1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjOpwMyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBjVE2009516
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qtys+UwYQJDee0TDK9sL0lOsRfu/ry38lObN7fPTrtc=; b=MjOpwMyNoFf/Uqfd
	hKFNYqtNDvck2NsOE4H3+AfDUMwVqLv1CzcFi6wELusO8JyTHacUfQLuZu4IoXrX
	yD7ZU/LNAUKFtwOYxo5PetgZvm2ockU+tfWYxS60rP1PQKGtRPwgpuF3QVQ0k07z
	boMdPGRRs8V3km8nAmYRGQ2MCyEa/PUGx1uuTbbP2dNgITzr1zcDhtUgX87qyarF
	e9Aj/ALSUQrji0CNiVj7l1KcsVhKMVNAUUdEiCO7HVjMcP69YWGSZU754CJcEswQ
	A9RqFkFASjn5Ha2G7Hz+kF8lR2kj5jxA6oqZJ5+6gRnqzKe8r8Mny2Y4SCUiwGyh
	cY03sg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j1e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbccc4fa08so4116556d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879616; x=1730484416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtys+UwYQJDee0TDK9sL0lOsRfu/ry38lObN7fPTrtc=;
        b=NpwJoBtmJ0PIse7SA79E/aOesiYytyy0MTRqWYfoekl2NFlESCJbBijwzhjRWSmQN/
         52YhdIzsDKf02hNHwG+9f5NOTobXHye7grssMSl07riUvjfhYjpQ2+0WXzFbiXHFiCNP
         DpaMEPk0NsTYMEzEQ0EWWSmt3NTOOPXYqKohbHLo9q6ShpUNWPUEJbNzUsy1WLhDvuAA
         Y1xsR6TQRVibi8QwZ9YCco3HdkrCnKeEaXRHjmnxqfaC3GkuCekRhZLrxNkwDQXn6bPZ
         D2JrBWxhdldXHFOyxeC7mnYPvbzk/GRJrgLTNoZPWF/bQ2iMMg8/U1D8t4xRLbGeWpwc
         rY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVhaU+9K3T3DZ3xGACa2swxrtKVs70byrAP9TBM6kQQKvCsM9t7nmJjifgbRsNOt4Z6CQpOFjuMN9eNrUzH@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZQ0hH0c43EFl7A3y50pBi2nmNKxKbG+rxiis+p4I8sRo/2XJ
	JBeV+dMJWfBfUczd4egVnA6yxoD05FSdSM4ba0LlVw4ir0m20a5ENzXMmUbiO4WWIkts6Br4DBD
	BImqrVfH5qZ6INCT8ZwhvHuDAFdEolFyh4PH/3Sc8iJDSIKW9tw7ZFK962TG/DjDw
X-Received: by 2002:ad4:5aa8:0:b0:6cb:fabd:b12 with SMTP id 6a1803df08f44-6d18558937fmr2649286d6.0.1729879616386;
        Fri, 25 Oct 2024 11:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXtOtSHJj19wEDf56FplPgcbGEqvuB1SyqztSMsgdQ4IgkRD+q5ALsO0BouBg7l63pOs+L2g==
X-Received: by 2002:ad4:5aa8:0:b0:6cb:fabd:b12 with SMTP id 6a1803df08f44-6d18558937fmr2649136d6.0.1729879616114;
        Fri, 25 Oct 2024 11:06:56 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c0c8csm846667a12.42.2024.10.25.11.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:06:55 -0700 (PDT)
Message-ID: <165dbf35-ce82-4020-a93d-4170217da32e@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Convert mezzanine riser to dtso
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-2-cdff2f1a5792@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-2-cdff2f1a5792@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dVXgwGXwlftyjjlrvYDmUVEy9T7d1g71
X-Proofpoint-ORIG-GUID: dVXgwGXwlftyjjlrvYDmUVEy9T7d1g71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=847 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250138

On 25.10.2024 5:43 PM, Bryan O'Donoghue wrote:
> Convert the navigation / camera mezzanine from its own dts to a dtso. A
> small amount of additional includes / address / cell size change needs to
> be applied to convert.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb3
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

