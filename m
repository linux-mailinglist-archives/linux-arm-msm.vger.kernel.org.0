Return-Path: <linux-arm-msm+bounces-90220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJvnHntEcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:38:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D069069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D5489A4F39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFAD500955;
	Thu, 22 Jan 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3UjznkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDVixp1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFB331A6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093569; cv=none; b=UEOBndQK16ShhJWYApl3PQNtCzC8YUzSk1iH2SXOSp+H2bPXQfhPGm3mjLK3Por2vBY0hz44JS47M7CO0xbWiJikyzPwA/9Lw1dhgVuxBegZTQ8wYF1nRRHQgrOpYrGwjY7QTVtEbGtwpE4jxZ1r86OImrHr1FQ3N1U34k2aJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093569; c=relaxed/simple;
	bh=Z7qPr/O7IC6yQ/ZIXSOZkBhX8PL+S4ZGN2/q5hIpxT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEt6H8m1gqaUhPTa4s1JMLcnwBesLYB405UwJyk/2yBDGW/Twx0k99ar22EADxbfc2Ro8cSvJkIZiDjuAvbaCTKqFeBqNn8+eCMXXR3xAM9NPSI3OBlkXDTw8cYqUcgym9VnqCe/BK9Q5YueqqRwBV3DEJyVWDYyxrq7l3i3w6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3UjznkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDVixp1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAlnjf2915339
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKcRoLQqWkujWqW6j1SahMRvy0OgkJQmrSTZ4O6yqRw=; b=Y3UjznkZBre7HiM6
	V2JNYyAJERlbS99yESAijO5I0K+8nr9K2ENKZE43u6x3meWoDMtb+wUJxYfF9eKO
	Y5+JGqxcEWxEeQnLgkau/ufAp9uq4vF08AGO68j/ip1iVvPptf39KLp/1Az9Fa7w
	TG3KiHWTvDLQ1abZVrTkvb+nl2PqIlBPKooKq4vCNTBdZPOWr2vKMXikYwozc0EF
	hrFN0dKdsdaPXeRp3H1I99jXUuiC+Qqh9Pw2vn1vbME2j+RBME3O/e8r5xQTDOLH
	yHTWHrOEd0p3+NggZn9+LnbGDLpmB3KQLl/eCXh+qYXFlYVDKJT3KH6+J46cO5o2
	3/C+cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2gpjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:52:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso33627085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769093566; x=1769698366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKcRoLQqWkujWqW6j1SahMRvy0OgkJQmrSTZ4O6yqRw=;
        b=dDVixp1RdHkdo6ixfNzFlvpn7qliklifXStPfFkfFPXtlywmWjcmQfHJyCK7lXkgsu
         ZCHeLocSsx54jzvJ9+5UouDqhoSImHm7yhOPKb/SsJnesXs8Nel9jvd84rfAc8lnMwVK
         pfWtyttgEY6mQTx2w/myK13FCReh41xpQ4WmHwJOYmn2pGoPyUA3SRPR+B3Rgz+br4Zb
         jifeTu3uffIxBfZrqJ8IAsgqARPEAC1aoQOk/qzUpZ/gO72vBzVoSydCP/yWRHTSRTZJ
         MbH0ZHq6xChjiY+LHxnYxN5vY1Ozva2pHvGgIYenWyNUprqDXxNyilV4Dt1+TNqfGeCH
         R7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093566; x=1769698366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKcRoLQqWkujWqW6j1SahMRvy0OgkJQmrSTZ4O6yqRw=;
        b=KRYOrRw0Vy8PXf9u2vd2fMlC2GGptAQB1lkxGIpwAytznCnngtoKrToC1KNqu+TsCd
         S/n/EmLAjbmCjb19h0PfIw4DB/ed3KgrNBYSAx7rYxfZJZk85NEY7PjCvUO4fwYc6CZ3
         rUBHrLj0fp7EMDwGsIU/s/Woe9+crT+R2GQkkbM+oPHFwC4Jjg0Y86PzgS4SGdUQKhHb
         vINIMbnYir6IHUB3/dh06UweZROge96Z9vmDZG6kkfcRtLWMTmJRm+SMz+V2bMF8Aaky
         FEvMr0VHPh3Zn05CzA3CB0YjXOnTiXxRyGRtmc+NRnbeRnlc82oyoCU7ecFsMa20cboI
         PrIA==
X-Gm-Message-State: AOJu0YzxS/flc+xOyzgLqWhFuA6ZX3zMH7KtoXIlRa5qSul8ocj+yQ8Y
	jce4Q3/2+URTD9850eLDVSzPokpqcrx42IvDytynSzuSxPpvdbSJKbvJjLoj8HtzG3tDLGSYXhB
	Oe74+eWWMzEugpHQAffn2hBRO3VYeDRvXaE6ho6Up68ex4v/own+4a3dYuPcUTrVeSMSk
X-Gm-Gg: AZuq6aJBTlZ96aOUAcLvPI9E8KpVK1RbNcSC16ioDYRkeM9BhyifrsNUZJBEyfzfEj6
	IIsuVw0RJwh9P2X48WwArHOTRWunS0yB/ybFQNnEpiOcrFxXZ8L55WLOGI+6SkRNsTPowA2hL24
	iWfN9OS6g8nXFJwI2ZI5/nrFBNk76w2fsIQRt7k4oHlC0dL4RtJi+eTT8JUK/m9pRjpyCTGVWPv
	/wmBNs3gI4Tf76DUhekQXL6J40RnKU/Hg/ulZ3JsnEQpTONLNQ8CjR9Y2uXUzZ9jb9I2yRReUMB
	6ckt6TfuN2JJmsJkx5PGEDV1vpkv6xUNY/69snfKjk3vWR3LaBNi+EZaZ02MHjFAcT20iGeix0b
	VKO2fzZ3pNNfSxueSIvLmbS/z800ZvqkSHHLnyh6I2NTvTlQmt+Seu1bV7D3fdVzwSHM=
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c6a67cb0bbmr2188584185a.10.1769093565902;
        Thu, 22 Jan 2026 06:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c6a67cb0bbmr2188581285a.10.1769093565433;
        Thu, 22 Jan 2026 06:52:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580781b7f9sm3817217a12.17.2026.01.22.06.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:52:44 -0800 (PST)
Message-ID: <5ed9e11b-cfed-472b-b92a-e6b34c50a39f@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:52:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] phy: qcom: qmp-combo: Prevent unnecessary PM
 runtime suspend at boot
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121142827.2583-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1vz5_ZTrdSEc2zmJWYltITqjHrqQmYJr
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=697239be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMyBTYWx0ZWRfX5qLxs69YuDM6
 4IheHEreCG3NQ8uxK8ZgYT7LZgXDWyhqNkFWfYL/YKmzn7E+0eaEs8VokZmBNpG9NJzZUZpBygH
 dET3/zi/Q6bzkIV3Tcpd8hAI2v5fLPnIG+o3YGTdCrP7qoktq+B/e/D1+P4phxDNWbSabAbxWdH
 06FrJ9hTfIOCTAEd79JhvGDorIqMMgSaXC566S5wpuT+5koqxH5im9PrCF8Jrf2nEAl5AGl+JhR
 BuM0qkSeGWqrU9ulLFrMSpzv2rNQ5qMwG42ggoAMMU58XbQl4YX4vPigNMFnOoeyUgn+N7w9bBh
 dqmwOdGj9WrP06vcVbjWWsOLIKrw+zgfUGJOLSN+6lFf4OTqAYXfQCN2qMCRZRYVPIXVVdK4b4O
 Tc8UguhVarhNrLVayRg91awdDySRoxVmmUT2tGQ6WNrq4UysgSfRfwngnXU7niY3uWnxd6eIuLr
 hovL6UX/dkyY4kfs+lw==
X-Proofpoint-GUID: 1vz5_ZTrdSEc2zmJWYltITqjHrqQmYJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC1D069069
X-Rspamd-Action: no action

On 1/21/26 3:28 PM, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


