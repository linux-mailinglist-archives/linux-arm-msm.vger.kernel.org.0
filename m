Return-Path: <linux-arm-msm+bounces-103759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCmeEacg5mkMsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:48:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D804042AED7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6645300335E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D96F2EC54A;
	Mon, 20 Apr 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+jQvxX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBuMAQeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40CF21C16A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689316; cv=none; b=KOp5iGoMe0EyCVXQi9X4T+YWc6IgwTsd094LFLLrRXkBxFU28FRxfGWahQwy4T8okOrdjVSsk1qmPoSCPYmYExoS+xSZmcdW+p+CNFsOid9zZp7b7FWdvTYXCM7BLPO8xtFfM6WY2tHa3FO0c6yO2Q3drqGKhVSB0Bxz2Uf9VC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689316; c=relaxed/simple;
	bh=eBnnDrOKl6rFrvA3B7Y0NNp1X3qub8ZzkCEPDODIVyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPq7j1F1MTl+BxwgWZaNRANjsNIsVEeLGFycOYc8Xnb7onaxNkrb5jyVCMbTunp+hwSXwpTQ/AspajKyZjwOnJ/HN+7rZWkhzaOa4bpTKNw8RUiH0BPzOL2QsSmDOZMgaozIARQMTrf+tEO0jFAgc47Z/mOszGf1Qa+pZ93wNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+jQvxX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBuMAQeU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBKJHN3212158
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZUkaRZar3uett3k7xh3LbT+s8iMVIVCIcvK7E6tblw=; b=T+jQvxX7EHfS9tTR
	B1Rn2NszYEcDq3XVB07/D3PJSNpJxGxlMP5Qa8N039aL2HgHdyP5TKHJloM3s9Cn
	JEEdrgkCWoJMpqw7WnBqO5fm1KGwOxOkUcVCjZVB6AWAF9eWAG9aKkiLsqj7sJQ6
	K3CDx8/2e3ZyTF2KKttg21pdoz+h1r8sskDqBci8jqbGDex+LAPLOFVjK/en0rw2
	FW+WHZd2014D2IKUn2KvARm8h/dvXDEmQj0Fgtmsp668/8v2GXok6Lc6UC1tN8nt
	ISZylNg32fFF5KqymE0Mzj9avcgLu3dN9V1EloQooMN0PYge8CR74wigAig9NgEb
	ZUHwtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfhevx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e06219cbso37995735ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776689313; x=1777294113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZUkaRZar3uett3k7xh3LbT+s8iMVIVCIcvK7E6tblw=;
        b=YBuMAQeUgAyM9JXWjZ4AUIwkCLrGdh93KpT+vEXz5v1zE3B1hnS+ylq+DZVsDxpSRS
         JXyOo+iG79TWpcEHIkci6TJcVKkHFNB4DteJ0gFyzNbvR3m1Doheu+o6SpQOo7Y0Mnhu
         eC6Z9GgObQ1U60CMa0v2HWZlSNrr9sYxFQ75YsOdkdLIPMv2NNzz+e4mboKPq8JLecij
         pR0Tsi+TFesa/K44M+XQoCi3p6CNW0FSorc4CtwbunYEShWEfA+rYcIITmgac5cjMa0J
         L1EGd4miZ9xv110ErNXDf0mcc0bnPeM5mxe97gANnvRP74n7xwsv2OxMoJla5tg5UtRd
         apWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689313; x=1777294113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZUkaRZar3uett3k7xh3LbT+s8iMVIVCIcvK7E6tblw=;
        b=cXtzYqlGSjs463T+cAnbkn6LWFy7NtTYt/wx0QfeEYk0BO1E0F4aKH0sDMp+oYKMN5
         vFaWzYo/IfAcPxH1I+hkBz8PKE0FYte7MPE2AOWZ97XCNBKv9B9gBKiRTv5S6rwXQuJa
         otqlWGd1TYmPxM9oJQt9HFZBHiSxz8aDDZQ/IVyV9sTG95XH7e84xw+av5MJQO00i2K5
         GamJi0aeU0hZUe7JiR/zTar3YfQheVc2I40GBnpJuTdUd6DCvUtXUZwuH6k8xx9qgBvE
         485nr9VMQMslnHtr97OrJXzNdVmPnjcJ+gJ9xADbFfVdjkwqx1cS25vnmTeN34uyqqI8
         Wo6A==
X-Gm-Message-State: AOJu0YxM11qWgcR1P+AiY3s1GcIbor8KGbT0g6UDY1NC84YdsWijK+aP
	sbhf37u1N/o0KJbFtTBBZV+hD3bRM2hHMVnfADFv6qWbM8VuRIOAv5PD3n+Y7CtVdvxPDI8vnSV
	e5LfqVpLICRc/R1oxvJsDchKpBNsB7NhhBOok6C/xs8eDb0xC6lvs3u0MIkXi3eevTK/i
X-Gm-Gg: AeBDiet/qt4fnURt4jx5HeCnQkbdgNSq5dtoMEwk3I0QeoQ+f1p4u26h+1ITsFPBH/7
	aYgFkxPvGdFwj+a709vFunV2+jH4ZnkACP7pK+XVwAACwFjmzwJRP0ZjHVzlg5MFuM/nYMdRQWN
	5mXCbPJFObI7zgGukQo5Z2U48F8bt6ZtoVCb/Memv4ipdIB5ButWSGcj7Ol7EKNjneW2206/67p
	sUALidt1W3nruNoWocrOjLOsAEfZwP5clvdg1am+I2LSNUpcsVj05hyerjcasBmruViEjT88Std
	1y0S/zpTnwgg+vngSuXeYGC7nsS1vwamDcGJsPsoc4gUp557m5Y/MgScLX2gltPPIfFs0v5ePEY
	SdTHOllu20JamwEqPlH9gxLepyBZb2kP0RH6KNW/+2G6NTJsElYhpqIBSCL8OLoM/0xu60q2RWU
	oJRk1xUf6VhEd6/MXgi9JqNccX1RNE
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr130617665ad.20.1776689312963;
        Mon, 20 Apr 2026 05:48:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr130617345ad.20.1776689312498;
        Mon, 20 Apr 2026 05:48:32 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2e5cesm123507155ad.25.2026.04.20.05.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:48:32 -0700 (PDT)
Message-ID: <12e8a8de-49b8-463a-8b88-2cbbf1ab901c@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 20:48:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <245f4589-d7ca-4d6b-8162-a86972752bd8@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <245f4589-d7ca-4d6b-8162-a86972752bd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNCBTYWx0ZWRfX8iyfGjRq5Zs5
 hfYMTa1rMMEyWlw9acSHNM3WLww4XnuqHe/ZSIpdhNqj51wSXShRQiBM6yXmo9KK8PmrQUaUOnv
 HucL3Hh6CXj2LV8H+NFv55csIdCdO1unxLjYLtgE5/c5V0XTim5fcP4/wv8BfEEqY7M52p6YJ4c
 Sg5s7LCGqRcH9Hv8euCCGrESyl0Z5Z8rKDXVti0DD9nyD/3BcFrJME/gDcWLD8wHkhqbB3Q4Pwj
 0JBLkTI0ohYmQ6DswzLMIctb/MbwSZXLjU0R8Akl0LfLJ8/ycxNEorkbFUvXw/fFcwbaW4KlX7N
 GsJmP8IiqrtmuNz5wG+AtSzHq4DkL67zLAV4qglQaPKFvsRnSduVwaQt+bIiuuGGYz5EPNamPs9
 l1eo0qThMSLYNZ96ax+rIThMavry2cj2bUfjrCKFOl7DskHGb0ZK97ZWUjYRNEpfIjn5If5obxa
 yHyNhO1xn+S4kS+cRFQ==
X-Proofpoint-ORIG-GUID: BhB2BWAX3IrowY1vEd29r7k7Y-JnZJLs
X-Proofpoint-GUID: BhB2BWAX3IrowY1vEd29r7k7Y-JnZJLs
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e620a1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MJ-xSMSjBZqLI239gzoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103759-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D804042AED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/2026 5:34 PM, Konrad Dybcio wrote:
> On 3/2/26 9:28 AM, Yongxing Mou wrote:
>> The eDP PHY supports both eDP&DP modes, each requires a different table.
>> The current driver doesn't fully support every combo PHY mode and use
>> either the eDP or DP table when enable the platform. In addition, some
>> platforms mismatch between the mode and the table where DP mode uses
>> the eDP table or eDP mode use the DP table.
>>
>> Clean up and correct the tables for currently supported platforms based on
>> the HPG specification.
>>
>> Here lists the tables can be reused across current platforms.
>> DP mode：
>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>> 	-glymur
>> eDP mode(low vdiff):
>> 	-glymur/sa8775p/sc8280xp/x1e80100
>> 	-sc7280
>>
>> Cc: stable@vger.kernel.org
>> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> I went through everything and all the sequences are OK.
> 
> SC8180X will need changes, but it's already incorrect so this
> doesn't necessarily affect it
> 
> Thanks!
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
Thanks here.. I didn’t notice before that SC8180X is different from 
SC7280, and will correct it in the next version.


