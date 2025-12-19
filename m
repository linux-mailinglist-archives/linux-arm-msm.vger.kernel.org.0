Return-Path: <linux-arm-msm+bounces-85894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98520CD012C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDA3305F399
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E775131ED60;
	Fri, 19 Dec 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYlijHxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKjNCCDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9331D375
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151073; cv=none; b=YOstTVi9DO7NdvkTkslmhD4SmB3vvyemCSqBvjFhp/LRYbUJunTgirXP53eTM1S3MmZ/wO4GYY8m9vAm/ctaAMMIMAJsa6bRw44JByP+SePbxzy5pquLkgeSyz0JEVzhaidT/oNip0trZkXkmeGAFhbswLSIxbJaTId93gZTqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151073; c=relaxed/simple;
	bh=dEmBppkxaay4i+N+h/ee3+KsupdGObJvGv+u/lDxpZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRFJo5vsVe0+uJDY1PkQKvfgx5PiXHEEUWPu3ayXhTS7npALYWNKfgMOEFODTFM6AmQdguiGVmUvoK370G9+VqseLStnjAtYNjUn8ipfRzANVTqbskfyRMNWy9T03lRhNqh0mkJk0LaZ0LnqA16RJlgzeiC3AnLGf0NHf9Vzz2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYlijHxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKjNCCDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBkoKG4145506
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=; b=dYlijHxlSsNw/vN7
	mApopERZeygtqz9ij07Syaxz4zDP0ovmENIBauI6PDTiK9EiNbtk1LG4PQjPLRTT
	pIiMFXFeDra1AZBqU+DUuLpoauL9QfBBxBrYoYO4uffTw0g84nKZavGWSnvLGZf/
	/y0kJ03ztCElDiDD383IfBGesqnp+G+IjfxzU287J0KVVfELYVNdr4AUoEukrdhY
	3td6NtMGeKvCwgKEUWobEhzWEdrV8AUtjf+GMAzsZgAszlWor6Yq5zhfHGSrxwvg
	Ft5BpOf1Y1NXuMt76MkpUxJTk9JKTI39tPeMQMaYt5uf3gflCSS4cDX7KAYzNzMd
	ezeQDA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtsuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:31:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-644773463e8so399951d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766151070; x=1766755870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=;
        b=KKjNCCDf7TLZ429m99i/T6SMnxVl7vXI818T1Z/ujPUiWXW5DwwP6UvT7euBaYMFX/
         ky5vdhGg+iowrpV1CiWWtKUZ6xZxIn5be6W315FDq9I2n9u3yr/rOKRDjTFiEkI98zKE
         JQ0lvT5fQMQ3QSfV0MamNusFQhFbg5paE+5kFDlQhPd6h54rH9hVmf6JMQmo2yz3bFY2
         MPwOALhzvok3zMEvfuPMSJqvUpg5sfLxHhSq7hhNQsiSIAqzMh4Q+QipLFhvj7QPEDxJ
         lV9Pvl8rzcQ8yi48BAqKpTPdyjruuv3U8s7DD2IKdxWDlFUl8G4ITJwFs3K1XKjfdXrQ
         BftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151070; x=1766755870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63FZmjx94t3vOCQ2GaeFBbfCszGhL53iuxJuREliAh0=;
        b=oGjXl2KkXIUQumwRrbpaxELszKwfEmTR0d+UJbawwpMpE8QMpKOiMcdUd/Mhg418hB
         iOdzVcuVl6U51f3cXojlJFtvkcGthLhie5eypIesFHdZqhyi4D6FPNHufPxTfeGRRLOz
         ahISZsegVKfX7FMoV7IP3etgGz5gMRoLJ8dYJoNEsXaZ94VBB4P/dreTILXELUNxuk6M
         1DZbWLZNlpJQ9KaIkhrV9QolJebowhUPX8bJ13P4u8cJiUU+5nO/NxLVlkgS6dzN5Bkj
         il9w0TZaWyWk2Ye0giQigQ7EAG0/oqHUikAXFkDk7eyHEXAJlSrCH2CepvKRQm5tiumm
         X81w==
X-Gm-Message-State: AOJu0Yzq9G/hxOZTBShGKcw0giE1micxdHLOGzXeql4Z39RnR++DEuTk
	9f7e1Gbkowb+r3G94ts0lOGg8ri/ZRPWYyl0zObKvitvtJeTZ4gwsNFQk8OSvp59uJiCZn/CEKU
	kbxyZQBwhCJGdWGZ7oSptvXS5qm+lRTpPXeg6z/PgmA1z6TZA8q2CGXUG0SyiJBjuXZmz
X-Gm-Gg: AY/fxX5Au6IT9sI30rZYCSeK4yaOsd20ZmLMoWrlk7cRpirU6KJMiYsmYvBWYT6vmiD
	hIc3xeeGzHgyfgZDUso6zIdpowm7TYePNwbpwgb5OnMLFiBxyqCeYsU6AheDgyQ0hwL5qjGkZhn
	VkiJEa8AGM7wb8MRN7XvaBYAnsOZe4+cFV71ezzscumKZANhgIrLuaxi9/ozt2pbK8fsFLeEXwl
	16lq4cOgHmyhHV3Ow0RxLT6tWFBB/sFOdPYVmeSwSeM/jCtOrg/zcMbExdr+vngpdP4xgj8pGLa
	OUQ8Kbc63zh2hTuaA6Usm2fZ1AM8FZ7UuKv4k0/+4Hkl8oD3V5B6VzxwLCaa90N7lIc4Oz6GsqU
	hMmLqKSbZaRZAVPmsoYKKzUbr2z86vpaZmJ7c5Qh7VAyT8UlpjlfIZDMihIbenPW9MA==
X-Received: by 2002:a05:690c:c507:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-78fb3e6940dmr21821727b3.0.1766151070173;
        Fri, 19 Dec 2025 05:31:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcuP6AViHgjtSGuGdVF5GotpiyX3Y8C/WU9irJwTqiCa8+DEcrW6sklLAWctD0A0BMV99JKA==
X-Received: by 2002:a05:690c:c507:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-78fb3e6940dmr21821457b3.0.1766151069795;
        Fri, 19 Dec 2025 05:31:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm240415266b.29.2025.12.19.05.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:31:09 -0800 (PST)
Message-ID: <f4cd079b-0b44-4ea8-9aa9-9bfaa4c2d03f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from
 q6v5 struct
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-8-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-8-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: on20yI7wgB6gCYS9I0xJepbzt02Muwqq
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6945539e cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=TZsz2u26A_VOhFdBpeEA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: on20yI7wgB6gCYS9I0xJepbzt02Muwqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMyBTYWx0ZWRfXzRBvDz2wwtwq
 EwGb3GcivcClbFD3nMCeuXxCLc5ne1EUnFH+QhfTQv984nzJgtLf/i210YOGi4NVy/YS2x6S5Eq
 gJxRWkPSjdF/WrR4a1VSU8p5YuhOWwv0A7asV9LsueDwT9bvneLptHh4HTSKE6xaDONgjmyBYOh
 nAMxuzH3SxINljyP0lVKxjzw6WAqGAj+ugtr8B/3z/zHRzM0D0Unky1DO+mszIaT8+rvw9J1oGX
 PGWL2kK7FeToqa1fZ0kSor/YG46luMqiTjCAl9MKMUayyns8izNbb1sFCzKUAfSi5hEdmxFoy9B
 Liw5AibuQwLnLl/mdgU89DTiDT0BxuPghccQ+S3xqwtklnhfj+oPvqKdw16UNynUIPnOSioYPjJ
 3Tx23LngWJYeNJJ9jJ7TyNcUcS9QoWD6SVgi2WqxFKskxJiBQJgffyFTFAsZPBZtqafYsCPye+p
 ryVFRtdUH2ghaHldi3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190113

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> Three of the clocks from struct q6v5_wcss are not populated, and are
> not used. Remove them.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

It's worth noting they are handled by the driver through register accesses
to the Q6 regspace

This patch can be moved to #1 so that Bjorn can pick it up independently

Konrad

