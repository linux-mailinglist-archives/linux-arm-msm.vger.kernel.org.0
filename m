Return-Path: <linux-arm-msm+bounces-81803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607DC5BFD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3569E4EAD0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F092FBDE9;
	Fri, 14 Nov 2025 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Agdsjr43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2pl96+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619026E6E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108982; cv=none; b=LJKvheyBPS24MihPpYiVyjiXHI/6CBrBEX82w9TGp5vmDj76iaB7cZE+BN3W223UZrjqQRKgCmPBmfzRuCuBSP6CBnPPW2fBMya37womYGHkMj3SHUep+Z3xLUoTaddDH7s8O3q58tV8UI/1cPCgV8rECGh2wzjUyeNCIdbN4EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108982; c=relaxed/simple;
	bh=7WH2ClojFCLx6yfXjuqsqmH6sdRwYsJdOnyHA/QNYqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWGPhWwVefsUjmQbmU1/h0keoKxKOC6+tbg8vaMiWyUEn8sI+cXFzOk9u6WkC0ABOslSw1/gQXVsVNa3+jT0xirLCH2ClaOacmkrayoyQ5CVMyR9KBdRJPlAmW+qJRFeMNJsBzTNq5Vcx8XjCDQM2FMptECIA610PP/36bJBhnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Agdsjr43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2pl96+9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb4kD1488265
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sCUjW0j6c+aDoZyHaoUwJw9RTFBZUbgXKMKXLzQ0Po=; b=Agdsjr43j6gUPceU
	4PBYqFHNLWayIWX8eDaefuf73jkRuFVHxxaLHRdPGU0fE5WcT6Kti07apx/pts6C
	+pai6iSD5U1Sa8SBZ96X1bNb01J/NHQP0uTMo5Pan65HYaB906aN1TqcPMKLTTXp
	pq+l6ymIy9u34BaYAwteJruSY2TBL2DZY9/e7HVrA06Hgm55geGb/fkP7WSkz/Mw
	h/GVQDgm2UrpEYZ3ML8+HpWmxPS6Pnfb3jczy5MiOEB1CBrSI0lTYkZr9/fI9vxA
	xiAL75NtKSLznVANpRGpH047Tr2Os0XPE7tbaik74gVd04O85uBFZgFAoR9PpjT5
	mr4jFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hsdd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:29:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8803f43073bso63367066d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 00:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763108979; x=1763713779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sCUjW0j6c+aDoZyHaoUwJw9RTFBZUbgXKMKXLzQ0Po=;
        b=O2pl96+9zDCqU27M0OtXZTpGQbAG8YWz/JJqlwQ+/tXvu/g98Ke66C0frrVb5+de3W
         qMgh2zB1NuJ/IOPcad6WPSq13ETNnl7GrbTza1Ea9St1EYmjgXchWYvZC65/llsekydW
         ljlXt42JIfDJbfA3FL7JyHIGkhsMlaFhHsDdsUmHWGmxQ/irdcWZ/5Act0s5dnN/O6pL
         RRxFsMPk9H0KG7akIDPr3SJB98Sz0v5HRF5LYmEWYaR/uYkkbCUmJMoo+7aqUn38tlfX
         iEqeY64fHFbLsxXr5DG/LBSVhjFkwwTavNoSo6jyB0pglA7sSy7USTOvgrBxXy20F29z
         MiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108979; x=1763713779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sCUjW0j6c+aDoZyHaoUwJw9RTFBZUbgXKMKXLzQ0Po=;
        b=MrK3A/M8yytOHEkRh/wF8mvYMPE34yk2OFWzQx6iKfAZRTCQbXjmuAgelMBfUmtJXq
         Ifn5jwFNPieyGXPlROJrRvLmDyhX0GS+bgWVCUkvWJiV8RB48eUW5loZvHhrCyU91sIp
         NfZ/THCpyhNjtTqz+Ti+2SnXcUZcY1RrPtSmW5AbvXnc6bNuHj9Y6fAIjCoqah9jPGC9
         G9iKdks0To1QkvghIwnC6vYrLxxmIFJag28xMdOqiOBeuuFcFG+oDl31jdQSVEkekj8z
         krdiDqo6rMCBTNqRFmUIHRCQx8yybzG8aOVB+wjhfP60yI/VQqZ7mQzOUe9T7NhRELyf
         HRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3XWOAGezbEtYSHhvH4nCQZMvBcxW4C3r3zUUkrQGc6qUDrEoLgD+89nga6hoctHArqII+eTP4H4dclLNa@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvHUj2gQJaLMrVYEgsWzgp+tNxUtzZXkyoxBS1G4OdOEExApa
	ltLweOdU1JEkYPTSAkOyLmdl5e6fbklwG1ix2b01OBq5a0hy6mYcmiT1noiVi0yRwUvTx3w9AWe
	nE04SNZuAbBexVXdDsE0aWsKyBKlZdwrkUP/ymuVQlG0zxQXU4fLvAbRZMjzQ6SLy1W9G
X-Gm-Gg: ASbGncvXp+MDeLX9nA5wIjMGlfIlMWQf1BUn/PqEbNgLYPlUt5CG3iTpVcBTTVWa9d3
	YEdbjevn9Eew/cT5L1OFDZ+YaVub+Sz3TH+4rLlIFKEUDjXmU+LdkTZOJ3VARQWJpQAbf0Zf9vX
	rEZKj13Z7L4gANqVXiEx1TkLg9xugAkA1SRsQkOdPqBcygPWXcO94LH9qP1r6d6Qchyj7WfStfd
	0WCfKOejTQcGzWbD78x+kvlvlP+/tWBUPcTroajBBpFiUOcY0Gu+EBo3PW9QtanYlQb8+TPcVS7
	xmIoxF9QtwZAVyODkOiSaPdSsvjCHGKmsp1pv7Lsdu8V6Q8CdeP5uEzvJZ08OjAk4NCL2VBE0va
	afPsZ/EzOyLyfpqBxYeAqwUe7UqbzTOQ7rIhJWwtcnewFQqVWdqEWDk5OuKS3
X-Received: by 2002:a05:6214:5090:b0:882:4a23:5fc with SMTP id 6a1803df08f44-8829263b9c7mr32998246d6.33.1763108979564;
        Fri, 14 Nov 2025 00:29:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHICIRyPQZiHcsaQqwi1agv5q+Y7Irczc7ejVXahFrEQ/6g8c8s1jiA8JouPwWigApJMyw0w==
X-Received: by 2002:a05:6214:5090:b0:882:4a23:5fc with SMTP id 6a1803df08f44-8829263b9c7mr32997996d6.33.1763108979044;
        Fri, 14 Nov 2025 00:29:39 -0800 (PST)
Received: from [10.38.246.24] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88286532f4esm27425446d6.37.2025.11.14.00.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 00:29:38 -0800 (PST)
Message-ID: <8d4a684c-0fa5-49af-9cd7-af73af55142f@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 16:29:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
To: Bryan O'Donoghue <bod@kernel.org>, rfoss@kernel.org, todor.too@gmail.com,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <IuFM40eMljHXycV-ScfwhLDKad31Nxa584Rqcfej5infS4sstQsB4cOhwYnnBB6TkJzon7ryQip1xCRGvhtfJA==@protonmail.internalid>
 <20250912103631.1184-1-wenmeng.liu@oss.qualcomm.com>
 <e13632e8-e845-41e7-a423-299f987ca73d@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e13632e8-e845-41e7-a423-299f987ca73d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gJE6q4_sg7LkzjAnVDRtrnMvXVk3SIox
X-Proofpoint-ORIG-GUID: gJE6q4_sg7LkzjAnVDRtrnMvXVk3SIox
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916e874 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=cZTxEZGIyLYIIKks7zYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NSBTYWx0ZWRfX7sLB+VEgY4f3
 YIpOFq6cqBkO9q5ypf8vL7iTBxkLij5SJZjNCG4UkLk+c+QTMy4lAEWOQfiNbL4E1H3ekEZRsUd
 jJExHe60+65FH+EQrdThTBPIA+EwhiHkXJexq0fDOEsQnHD5WXDQOuRzwRzL91Loy9Oy4NCltQh
 luYvHf/vmzOeoyRZq9vt1HPwLOyzoF6TiEGSa0dlQudPlDw7Y17Ao313dKhdlE8lMai+uKHuJmv
 wWCwg8TiVfgO1uu29bPVSplhrBvL95mBAn1Ms/UsBTrYonAo1oCUirQWQwrxviivf4w2h/Rh4Fa
 ujax90HyoDY/Dqi9xHzlkbmyIZ+RBpczR7FU/QQFsum7kaneMHIvFd5K2YTDjHTvfUM8mOjp3dh
 NgSn8jE0u++xcrO5604R3nw+1hwMJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140065

  > Wenmeng.
> 
> Could you do a v4 of this patch please add add
> 
> - MSM8939
> - SM8650
> 
> to the list of init_load_uA currents ?
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/ 
> next-6.19?ref_type=heads
> 
> Rather than gate the two above SoCs I think it is more appropriate to 
> apply those patches and re-up this.
> 
> ---
> bod

Hi Bryan,

The new patch has been posted.

Thanks,
Wenmeng

