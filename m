Return-Path: <linux-arm-msm+bounces-95113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIqtJGfBpmlDTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:09:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DD1ED6ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB08331822AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F1A3DBD71;
	Tue,  3 Mar 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0MPB9ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieluUR4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4D3DBD61
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535548; cv=none; b=JT3U9B7BYuN/iswmNdrLvLaM9so0BiIgp6bwRS6szAJEBVD1PkcWtmWsS6FSR4v2bm/KLXr3Y4cmOqD9vPqaSLHrRoMKvWrXYSfgcsKN4xSi7tEpe692VzAlotpTXz6nnSRMb/ClPzfz0oBshsnCL/ZbIbBBLWrtcMTiUoNeheo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535548; c=relaxed/simple;
	bh=/zQvj8C4EuySCNL7QK/jPYuOgvJBxhsGioSBjxxsW28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzYg4zoCCZZg2btWpElU1Rmas+8f3CIRiIL5A3I27/fMT5yKKJ4Eg5Ku1FCGuBlz+8rNbHWVfZJ6F+zqncqH06YopuNEZr/Op67oUNu4ba8jlrmCU2v3gLj+gi+ELZqdA/QRhiMZYSM0bh5V0qgSCzD/+lz4HaSjgLh2PZH1L68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0MPB9ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieluUR4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n20R2775551
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=; b=Q0MPB9ikSElX2h/U
	WcFXzQkKr8VyFAKp/jvDA75uXu2sLZ4iWT0fIt0eX8XfgemnCPll9uswnFo8eTQ2
	wTqG4WIj8BzkTp/fEOeBsOZTJ+qsEF21L9y6gYgVN7GsHgCZzgIxi1rgMHu/ilHu
	61WcIlBTtHBuoXcO9yFJ898PpxWD4vPt6JWOZLxA50H42u4nhQN8LcpGfh3rlPmi
	/cCHgBtA9TqfmIA4fjvXBbrtsfj1ehBfdJLNYzsxXV0xohcNRn3fGEkbGUadQGrd
	2RmjV3lP/2xCXRTEAYHyOj53fDCOCwSfvggaDCNg2pLCR7h6KOdzE1RdTwdrjyOK
	80MGLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm14nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:59:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fbe67875so9921716d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772535544; x=1773140344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
        b=ieluUR4qNPxjI1jPNbslToNz5Vcw7ojTNp3KrUew46uvI23Sszw2fKpSkvgGNbTKO8
         /IP4rcRykdAsxIH3Ux5kI7SERexqvLGk9w1D2Xgvn6ARRfkcpDzI8RRPvgPWUnPm6xtW
         9BgXfDNJwuqeCSWo1AAcITCFaYFMtnur1/L8wePRVUhvgU5Vkh6LA/72UNReJ9SUqrVN
         kUqm9KPtFu18f3MY1v/Fvx2y4j+cIKNsoXktlAqvN2Mmy1HzTkMU1mCxs3RnUiy5Bwak
         ebaJ7u5hnttQhsqXy2zaeGthHS2p0jGOGu8O1xpD4cy7XDMSUuA+V7RnELQin5F9mp5G
         lztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535544; x=1773140344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
        b=h/UdicanpIuqCfq3AooZEDt87syV2qHxzXpSaQr/vZhISxE/tjIMKy9F0u/ds1yzmy
         Mn+h0Cx5kYp9v86JWr5YPGFTpXxqQrSGHXG7x76wVFO+/IBayuG9Hv1LpfaCy7HOfpWc
         +EbPcfQc3MYUlxYStZcpgE28rPphg0zfn0qErt4jhUm4UExE4oxQFcc2mE+dcv8Y7C7v
         hwVax78Rv3fna9dQRkcFIugwWFvhujAtXomZ8hW9v9wNLe/8hV9JNhWaqQ+Z8HoB7C03
         09IXPyeWl0F0yAUTnvwS6vDkqqXH01enQ/ybjtQo32GlPYo2/z9rm5mykv5iULwBO6Ms
         8mvQ==
X-Gm-Message-State: AOJu0YxPA3c1/2pcMwuq1PcFPyW/Ir6/apkwqxVA+dSl8yIGHYNXd/P7
	iSRxGLXXlvuZHHE6nMCvf+H+dZN7DhLZXbbqZdNPzC0dpQgCJvihZIx9+w7RG2uP+GMgcoo/WaX
	yr48z1mjtwk1ymb6JUnjLaJ0vgeW1vBWfZQFLInPXxISL/jh9zxKcKlYhPG0hG190cWbU
X-Gm-Gg: ATEYQzzR0nbuhMTBg8mvMqbmc1S084hl0JBHLZ8F7M+UiWe4jWsoI3LVftbla4B6XNR
	p2GHo1qqB948j7vLFd399fSuFnHCrlbZTfVvoVxr8e5G86kmYJ/YkDJ+UplBte2Tt2WBuVYFjQf
	Pjz4MGrdJ42KxQ4Lm1c26y8f/FGeGl0tcWD91hSiQy5j6AWPD7W8oGOaFQIqSa3rsxATtH7s7/4
	aETKr7Qxo9my+Xu+7lKm+2SpATl/cw2o9nz+7utQvNmWQB5FY+9foWeIF4+w40wp5Cq7Ji1zbxe
	LSgfR/888ub9sLfluY8p5XQiDycwtQ6AniMa4ANJz08MF3MohIrRU3ZVxkFxswXbmfjepXbCrFC
	3RdUaLSvGViTaUm9hUO5j6mcu/JxL7YHfq7sWMupqP5cUnfM2PKq+OfUkWG8W+rLhaludf2KoVt
	0zbLk=
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id 6a1803df08f44-89a084234a3mr24645336d6.2.1772535543730;
        Tue, 03 Mar 2026 02:59:03 -0800 (PST)
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id 6a1803df08f44-89a084234a3mr24645086d6.2.1772535543154;
        Tue, 03 Mar 2026 02:59:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac546ddsm583723866b.20.2026.03.03.02.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:59:02 -0800 (PST)
Message-ID: <ebc0b989-369d-4535-9398-fda2fc09e5b6@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:59:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0ffidGJSLGzO4-30d0WFGFrZO3-V8GZh
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6bef8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OTa4uPH3y4hw8luG7FAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0ffidGJSLGzO4-30d0WFGFrZO3-V8GZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NCBTYWx0ZWRfX22/C1pO/ySDK
 CaxQDf6Ef1QnWzMhbehzl+OrZNOok8kwdoO5oZceWzro4oH6+Co6B+OATOsqRsLuKbEpw5sc4QK
 iesrsVVr725yhA0mnpuzmObqWzP5DF/V5IFyJ13Q69+gjnltr3lFB7f1p+yaKJqbRWg3eF4EzPv
 JBudhuXmFPxjqTkvB+4Ebc1vH4nn7oEZKvChiFxdnUMD1D+rWBfpOqxMD4VEaJTjCeSaCEr7OJk
 V9qbJFD4t4b7dbnt2nzZIcSOtqu7HoMyCo3JcxpDTKUyYj4O0lh1s+PDj3YAhkz8L/AiRjPdH9N
 sTDn2Qk9ZtjDYouMujZofjFV2uw92KRaT5Ma+CMzXq0QoNMOLIWq7yp8DJxaR/qmQoYNl2+vxTa
 6JhCA8rvx1QYta4tpP0w/sw+D07Ynj3GpdsHc85tnBNpZU5F2IHhxa2EflQJNhhitOyoPYK7xmT
 /gXhom+cM4DZO8zQIXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030084
X-Rspamd-Queue-Id: EC6DD1ED6ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95113-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/26/26 2:49 PM, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1
> ---

No immediate issues on x13s + sddm + plasma-wayland

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

