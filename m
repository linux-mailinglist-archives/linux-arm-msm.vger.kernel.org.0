Return-Path: <linux-arm-msm+bounces-77055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE85BD6AC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 00:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB5F44E7659
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 22:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C245246778;
	Mon, 13 Oct 2025 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Btl/Vg5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE71FCF7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760396123; cv=none; b=dcv3JFupXF86dBC5O2mbK+CBGfgDkHUn6AUl6gmWXipxl1wu1Cvsbu8JuHzRAxbBCGkHl0Y+Nn4QpfEuWrUh3Ux+rU+GuOdzx+LbCwVR2/5guIwJi/3BN/tu+9RptlA0Wsb0Jh90qrd0MK8ItvSDJYaOOHfr2iaDfH2JNy9ovRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760396123; c=relaxed/simple;
	bh=Koztos1uC+5sPMxqEMIFn/EK3B/Hv21h41mtKlfjHRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGfybxaewDmFrcPwwTP7WdaGIRZSSXk9y0UJg9KoAhD91LENrLnbtuGnnGdx5MNPqLUt3lgSfMKnlqUa6VqU9hvm0rGPzX9+otJkPGX0z66Sr+iIRQWc/yDY6FbdDAkw+o7TalLYj9nMf8O1eC4dZ9nTGidhcdM16q1SRCP18Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Btl/Vg5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDG5R021078
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJvaade5wiIi5+Aot5Dny1x8sOrKeQ8XqfU1xAZhvl8=; b=Btl/Vg5JO9RpIJiq
	fzCvAB1PwteV5BRO9QSfwCtCwQuZ68ubc1BlAa2jLoLxUaqmGs5WOtmDonzFwUHb
	QjI1YD0xi6G0qIPddtyZHPgyM58Gy3hfM22uzoD+C9/2xzGEPxdegfgENzG5ragg
	o+aL/JlOxZOF7wAzqAsUxPuryjaSFkRGcWPtUCEplj8TPMjFL98YPxx95CtrLEpx
	iitlChrnzjUfUA/K9aNlG2DTnrNdxGbG++LuDfUOFZn8UKdcCk9OCyMzv4poUDI4
	ml01XaNKiyE2bU7QXgdK6m13NJut26fXHVYLpQ670gx6wpHdc1nKyGxW1hFGOIfY
	dpPKXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bxd86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:55:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so10737853a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760396114; x=1761000914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJvaade5wiIi5+Aot5Dny1x8sOrKeQ8XqfU1xAZhvl8=;
        b=cBncbWFe36PXRXOLKDCHYBb0lekc7A54hg+7ONETPXjKH2S1/LMChWASAyXW+abrYM
         azrz6A4SHqfg+HXxi9RS2OEbbK4gKG8hvZElkLphBxsgxYQ9cIS1vci2SEGA7+eFc+QO
         yRwQux/BS49u2kjGD9TukgGuS4DAGKqTUv6cPWCT0OBN2vPWbVUUFaHKwa7Ewgweq+lZ
         XDHUV5EPQMq9fsFG7Bgw1zgWzqxZwpwJ8byzFB+4W++MuubL4y5AaOqX+oGY4xe+S6ed
         M2ncO+ldPjcLY7fiDu/OJsGxUG7+hx5cXESfBahs1t/5+5A+HeutkXjC9DOfNas9x4Zw
         P6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVaOCHFRlniOdCtlG/Qwu9K9DuDGs/vZPEBLk/T1fQToLXvI03rPnGwGWG2prlHMXFGzzlWkHfu/onDvveX@vger.kernel.org
X-Gm-Message-State: AOJu0YwatzEJ2W/7hrN+nruUbVe2hhbiW0VD8Q1BggC9WjsrXAnrH/JE
	w/kt4pdMGwCHRHkp6kbWmOM0acg8v/clLLYpSu7vcUCJIdUVlam7NCXS+QZ3X+mBYbiuLjt1ker
	TPncFBzXT4X1oCUwNirkaenUjeCl+7gBkioTAJL3S90aYK6GwChZUwOivBf4Ii9CLzlCL
X-Gm-Gg: ASbGncvj8x/50PRY3b5zSViFA9yGTQN5XVN8wLhz4TsN62xR+i6oK7fjlXra71yqioW
	hSpuSq62jv+ERmDv4iSi5ull7KFONFcQqulowxeh8BZ8i2rVrSpOkvEr9cXvsLXpe8I7ZT/8zfC
	w8CC9oCE3ByBedJceRkotPon3/vJXBul8olJRfTyeYyiHQyAaBU61j8g9Ft4dFa3goyX0eXZlJV
	H6bmphK9TzzEeD4noAZikyRhcU5qCGetgSrqielfD+GAPTZWMyvvAM37awxkBg9FCbNKxTYQJym
	39oMro65nW4g1vTj5GU+EmewXs525UNK2so8tjzXqLaV53o5SD2HwIypXgDLEox9gpWz5uOSS1D
	dOmerAj8xSlOI/piQQE673S0M4P8=
X-Received: by 2002:a17:90b:38ce:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-33b513b2ab9mr28484268a91.21.1760396114229;
        Mon, 13 Oct 2025 15:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERGLVRtfkJwQalTVYqe79Nz0FCXxHSw6T/F4eCyJ5am6YbdkaqPeme9FWs8U7Aug9T/L6ing==
X-Received: by 2002:a17:90b:38ce:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-33b513b2ab9mr28484250a91.21.1760396113806;
        Mon, 13 Oct 2025 15:55:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288043fsm10230270a91.0.2025.10.13.15.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:55:13 -0700 (PDT)
Message-ID: <1479e11d-3628-4a8d-b2ba-35ec45cdd3dc@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:55:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TjAXwWjGjhvY0B82RdMvPbAmxostRWlt
X-Proofpoint-ORIG-GUID: TjAXwWjGjhvY0B82RdMvPbAmxostRWlt
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ed8358 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXyi/eC+UkaP/2
 AsT1N3WfoUi7TXLKf263MIJKnXVL8CjC0SkiY7DzCrpiwY90++ByAnaQud+58SsM8So82affKul
 xjZFiFaqouq7s/yQkPjZ3LuyDDPmtwSL57Uqn0gGTPY8tMUfvzYzlvGTP6VQIDXpgoaMj6vWJwE
 ttbRZH1g++orl4/YRhGgnFlbPAbnSmfVWwHoqNFIyCSHXHCJWtzAuutGrxsfNYR3nwKBgvxfB8M
 sZZh73jL4cfYcwNV9soFIRU95A3MClnPXNh4q+Sljs7l85OGHqbwJqdL800AuB5FBGqppWYK9I5
 /CCmL2fGHm+q7NU/z3vthhW8IO+PRB62MNHem5jKwdmBv0v5cSrf1Tx7kwf4MODVtbIHIw+/Kq2
 CzWN+bsCxWgx7liV8QxJvTEMS0Xt6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On 10/6/2025 11:18 PM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Given change mentioned by Jeff...

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

