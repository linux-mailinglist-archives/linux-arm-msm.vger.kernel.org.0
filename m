Return-Path: <linux-arm-msm+bounces-102132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGy2H3Xg1GmZyQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C43AD22A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A25E3038796
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C73019BA;
	Tue,  7 Apr 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNAtzL/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khBRYCLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F63947B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558744; cv=none; b=effU9rX93z9yVWZjDJqXjEhbINWIIWgU2dgl8XdkwHGajYLzV1n7HyqXKm2GrubTTEYpm4i3pwTagrc9yXyNT4z2+lDp7oOFT+Alm8ZlsIvTmZFc8Uy759UsJhriQvdaJAoPC4veth6KMb7hUmI4apNLKSNrzHXvyUivr7cGOL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558744; c=relaxed/simple;
	bh=xUUtJfQpD5zq0EVWy++vHQ+5hTS94mPf6+N6g42L6HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gfnen22IHyKl2nZmzghAgKN99zGPeabN9m0SXYy6rr0kOr97MnVSwXPZ1svZC9XherMwtpSDweSuaOVbpOBb37hFf04XZLeuY1aX1uf8FfqADy38OpEdlqapfn8F6fUu6Ll4ocmKWoJF6UeyLm8uhcJMtWccxj3sDbx3lL5ehrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNAtzL/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khBRYCLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376QIVi2550302
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=; b=JNAtzL/DHaiddjy8
	2kHRZmVC/qJ1w7j34dXP3YOJ+HdABtxFTSUCfM4ytsyxXjoaZvZwocRb/pP1gM9c
	C+GUQ4VzYW0Pehml9gc3l/W82mxPrMD1G7g5FEtoqXgNBYp/eQ279oCYkNky0/uq
	Ecn0Cuj73PT4csMMCWhkagmDWfL0IQGaTMQR3UWv+ntzDM1BHOazZ0QMhmu4Y/EY
	j++CQ08BHFTeg7vnhQX3p1sxD9KzfgyqCEdGU7pt2G3C5wRWTMLBV8tXJHcWh7Uw
	GVb3woRhvv34tL1EtL6aH232wgda977QverjYPZvbGywwa2vUkbl4m+Z6e6xTqha
	uBfUaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreabw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:45:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so128783785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558738; x=1776163538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=;
        b=khBRYCLWlB0RW5wnLLRCj+eVVVc1fKzCdPv87M0N5i3+6pTySODnCRDCemTexr5YLa
         1pbbkUOq0MkciMM/Ddy6yAsWda4Rou08b8ws/ATBbUU3+LQbqUeCs5f0Bzo0fqHiFYEh
         cOQR87jPcxHeBqRpFAhz/NdPaVcJ2c1DeroTzTFFVtLBLaXzx0JhhHXPqVslgmAZ4ai6
         edbT0IkAqtTog7QP2KdiZvBx31yiolULyGmQgiiQ5xmFNvVQMrYMnVUM+IRdkn+m+qm8
         DR1Zl7KFONBt7AsZGLSq+njdCyanEWel5Roa5nj3OzTy4WyaV9ArmvL6VWudAhxlpj8o
         p8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558738; x=1776163538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oa2xAwC1CNOY/ehP1p0RnPEKv/WP578j1jDUe5fO/RQ=;
        b=J5tUOXrih5knPT97LTDe7q0PXC4255TwdsM0pToJTGwrs7VR86zZK/GVqG6JK63Q1g
         oDY7CVEWHutitnE2c18t3L0KUsNKMenJ7IPwhiTkNVEs5YTZrIqkVWj6kpxvqy15CNzt
         L4xjbPvya5f4QkKtdMm8zddG6d7NTlN6owcbUQQyQP9Io4kQfNG7v9NlWelJzc0O9g7E
         AWfD8BkFIGG3PFuL6Xc7rJcwzqWR8htkwZqOHMTVBBJteHzJZ3xcVVJVDrb4txJY2h43
         3nb7beQcmedHkhoJg47Glrs0h/bIV4jXm5MABxcvcTD2LcEz3o4QGhSblb1PFXpTc+YT
         NWug==
X-Gm-Message-State: AOJu0YzWzw7sVPgEd2W0aUdQgeSVOOqXc62sfk/+yJhFGTbIcifuCgQo
	tDIKbC36UynqF7wJ56jwwNe9TezT3k/8zE+e1gKEmoaw7BiOyRqYWGGyVmhL14B8C+NjLLY5v0C
	y0VZY/2pOLEcy954eIrKQlq/An4bhyDOj+hyEeGUI30RYeG5Eahfr8d1sTFEA6ZLHPMBH
X-Gm-Gg: AeBDiev53dbP2B4BbNPP9MLXhvtJs2+tgo79wOlvYCo82cNIIbKpEelBfuNcdSDP6rv
	mfQ1EtAc+8n/nt/UsHVZmO+/6i2tzuTj9FHZz27CN3mWiNYvo5N+XGSmil/wkLyHkfal8b05Yul
	1NyYE+iCprjGCUwQhJwHoS0vVfNcO+LbwOvDDfdTgP2nsodQunQw6f8oqTBtZdYvrxGW2Nc5lS3
	YMif7CMQYBiW/+F7OM0M2cB84akfRU160lqVyPg6mP6vbYxxVH19kfAwhtYpFjfT4y4je3rEjAV
	wnH7eDCaTTgcrwL4gcdYqKEqOgq50rzqwZ9J+HIZFavC3leihc//MsViaKTbek1uSE2V1G95vk4
	OB9qEbi/CRe9L2mjqVyBasQHNj2RaqXLGjQYBEPiW7kmqhV7cJfNC24WqTtu56nvCwpgrdIzPN0
	ro4Vo=
X-Received: by 2002:a05:620a:17aa:b0:8cf:d5ca:addf with SMTP id af79cd13be357-8d41eb0c1a7mr1574812785a.8.1775558738242;
        Tue, 07 Apr 2026 03:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:8cf:d5ca:addf with SMTP id af79cd13be357-8d41eb0c1a7mr1574809485a.8.1775558737808;
        Tue, 07 Apr 2026 03:45:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b976dsm4286446a12.23.2026.04.07.03.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:45:37 -0700 (PDT)
Message-ID: <93cfcede-25dd-4fa5-a242-d52292e594e8@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-2-e7b237bf7a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-2-e7b237bf7a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4e053 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ayDRyuo8yj_178KQ7yYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fcrexpXRQwiNPhDImO_LMiRshCD76gGK
X-Proofpoint-ORIG-GUID: fcrexpXRQwiNPhDImO_LMiRshCD76gGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfX/7VYspTcc9Gm
 KY+CpCW1QljdRh5dkFoLIi8OC/fHQJfC7E/eASWaWiX3IZYMZYS8J0dfNeQynLDQVdbzCQN5h+5
 HawYSR26ii6bq6mzpXLYN0Q6MVHP4GawIP1WIkpu8++ZkFfiBvLb0DwAygR8z8rlzJvkC/nduyd
 DrhW3l5x6sbtY+N6L4hpQJX5oIofPUkvrCrOg1Lqylhvr+YN5UUXjcKarlhkBqfqlOEpy1t8I6Y
 dPD70YzqtJZqfGSTtc8AUHdRDJNjJANNDmwYr/82PJ3JLq87gkIh3CWhilJ8xIQRDB3kLmGm7hg
 6Z6J5Mb7mf8ipfX4goaOgMHlp0lCAvl90rgaK0I6JwX96nFW3tDCJDBnjndAdYvUsFcuxJuvuOZ
 ABK5CCFpI7wq3PIh4aNN8vLERj5DFBvC+LGCrHSqE7ZYxHpeX2h2DWN+BgSPCDH3xwdBPSDjczS
 EjedpYWVfmsXg7t5Lng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102132-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F6C43AD22A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 6:30 PM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

