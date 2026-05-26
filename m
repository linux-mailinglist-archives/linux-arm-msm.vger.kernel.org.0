Return-Path: <linux-arm-msm+bounces-109799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG2aMNaHFWpXWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:45:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3475D516F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE911369EFE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422223E5A04;
	Tue, 26 May 2026 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOIOhAeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfF5zEk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD513E7169
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795534; cv=none; b=T2H0LNcAHtXZnRsKVspsMTl6/ps+0Nu+RzbvpvmXWYUleGrA54Zla5khpW0MiBntkv22KI5jr7hZeIF+GmihuiQcOiZmN+aPaukyeXEGwQV0pRqhQhqnLBO6WOnvJzsQnUhcVMrN1bhB/oLVKObFXBtPJA+LYDSsQpEAEtzzMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795534; c=relaxed/simple;
	bh=Y4EyEFYSbb/f+hsFEfhvNwUGVQsnvSEVf8ZkcHQkZEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MglqnuND89LKxbRiiplfVIwUnVTDH+NFw40wlgzknw/LYwe9h2FSW7sa2xSpOZSVbao0yyQ8fLEgG0BVNdZI4JGFCKd/ZTGRb/0V2wdSQ3WPHR7gM+OvHIFAWMIiemK3+p00ahV4OOn8FWbsKNs8RMBhoLqgS4scfDWv/2g5I3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOIOhAeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfF5zEk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QBU4cA1605273
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=nOIOhAehciDL0r8X
	yax84JZEqX9g+t2judWawswD2Uerl1ZRRmEoIDY3F49rDrIMpX+nQIJV036GH+UK
	n9GPI+W0ZH9zTRySlJ8ihStHDQKr7wNUGGYtEG5QAo5zEe5BNxFrVstAjhMFQqhR
	GGm9pMteCbYenttuAHge1wF1wJjOdE8MHm28ur5+tWpZ2oJqnv3w3VgCaFp1MvWk
	m2knHSnGOsgJ3pN2y9eYgspWZftFMBlhzq2a+b0cZwuz1szHo+v6DGCCi7QujOX0
	7ophqcMsUtW9GbcDsH29o0b8uBE+VcR+SavBsOc4M1ZdcZGUtsMxfpOIdCSyYvyM
	zjqHUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3sb3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso5958722a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795519; x=1780400319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=SfF5zEk+Ij3OiSDNbYiE72+rsgNZCMhb+8dgr0sDzexKqhxcqmrv4uvyIs8zBxBkec
         cWIvu533YXXpYUyYVcn68txSqMJxOUMC7LTLwSzXlUCLQGCoZ1WF/WU36cUnkO1B9CtT
         lG3lnxvQQTD8EyiZrreYiiLRsMdqILuGkmWOw193y7+FHFrjV6BlREIyl7j6gFut6IW+
         6Gl0yN31toRW1iJ0g0Gb7nLDgrt6DbZvReoXCR7PJMoirHJCDt+R7SyagIa2VI5zTPb0
         xhIC7BAaqo0bMlZSZYWLfiCRihPiRq4sQ0AFnBqKsK9EmVmQOrebH1blpvl/LdrUVZtC
         QPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795519; x=1780400319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=cLp9gwTYDojfKbP/aENLIWPsXy2LHz3L4K8NbMZ0yvWsbRlUYgduvh8WpH6WmK+86Y
         uPwc8vwi7t0HsEngU8JC6HL85vcZ7APRDBSpw/Jjqt9lYeYEvd4cVGFg1eF1J6iuc57a
         eEXHdWAmpu3T6MPPoC+oNBusKZxcfW6vNBmAkC4iuuv5WqzIuCNpNPydIn7IYzQ05h2L
         VD/Oyn+Hm1eOGbnM/2ULYZ6BelNiNGCybHDczswsVx606rfvzvvdNxECoIUxy0x/qlxU
         LASUUqqQ1oV5N+JZoGIyY6i60+48KBTz6rldpodQCCDurq3suI9CgWM5/3NJl5vR6AU1
         WgCA==
X-Forwarded-Encrypted: i=1; AFNElJ91DRWWc67g5OkwOxNa8Yuh0euXRKOaSQPupaesxqioq/+0xkCC0aWnOznb5gTSKUIGpR1NbzKHcRRCy4cg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eBVKnMdOMXJaWi7QXxcVl2trwFPPT0QRwITAmWtRxPfHcP94
	3ucEu/HHneG2Ro0YglOw5ipEh0OBMpZcXeLBzIGqRX9ACbLpbxSLcuNc2f/EFry3pcu5yu0X1Gl
	Mq960rR7BHY5BE1VBLZ7+ruALOqpDl1BrtZ5tarObNIPmSVJof0t1cJt896GZ7Pb22C6m
X-Gm-Gg: Acq92OE652UJn9MumEevx+oQdt2Bu5M4WFBOhK2Bd4e+hHYII5KimxYcsgyhAiR1qA5
	ON6dpc+V/C8RuuaDd5bmxxpWCrrY7poKtlKKvd0zvP2VW4RUpCym+Ap3Oue+ILvPZgb4Gr1IC3v
	hF4pc/fkoxTxFghyJBNvuh3ChQuvJe0QbVqftnr5IoSh7H0UTt8qIkltJBfDygiWHYNyyePjhE0
	QggX080b/TU9edov5886zGk0wCHLjl/0Fa/wKj/VzZnuaO/ZWd+jLJvLEnHP/O82Y98lezWf+AL
	bfyROOBf31Kl9LUkaKjP/33XOx8ssPvrNvNITQ0ZA9NrvEhdhkV8I4img4oNnz5DoTcfkoLynvz
	2t+pdfat7x6NQKxb+kIg9KpgFtW4e9mSre2wMJEI4fLsMShvr
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382864b3a.4.1779795519485;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382828b3a.4.1779795519008;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:38 -0700 (PDT)
Message-ID: <2140a893-8959-49d5-83e2-464ec79e0801@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
 <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX80zWzavgE3IE
 ys+jW5CfT0KmyPR3/s849s2zGfbZRpDxLqb2dX9s9JBeh/Z+lsJD9LDnFF67jUXl1ij5uVCqXNZ
 5dWUZtoCu1sFtfQlCelryr/nIba+xYTvbbXpM/WDP4dh3c2lX6ICof3Z8I3zN1zqm2TZxMplcfm
 zSFgSUE4Ud+bZCSBjOhOnd/OGu6G2ByDbLYWWhH7BL85ZBtW94Bri9SxFwlQZaXZfMl39hdu/Vf
 qbLcOR397FGNpnKLFNDxN52Y4P1nE1nGXIlUty5IV4Y5XmIHmKGLGdOyIecOr3VNelAFjMT9M8m
 KCxQmdIW7KYljVLN/MZ3NOOmTZ334is/jW11Ra7Gd/KsoINlza6jQ8EFC5w2pfDXFf4vQGM2RlA
 XHkhoZPTNcg+0MwbX5BMwLMyH3olicVGqFwoT8PGR0ndxtPA2GqzHN+LaZCgebQYUZcdhYoBJZQ
 EuPmS6FW5Shn4xwJb+w==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a158640 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=StVILoaL_uWnGg5ebB4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: qiFEHppqQ55-fL2XmNZz2pjL1EHKRDmQ
X-Proofpoint-GUID: qiFEHppqQ55-fL2XmNZz2pjL1EHKRDmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109799-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A3475D516F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:42 PM, Dmitry Baryshkov wrote:
> The camcc and cambistmclkccc drivers looks pretty close to SM8750,
> except for using a different PLLs. Would it make sense to have common
> drivers instead?

Dmitry, on Eliza, CAMCC and CAMBISTMCLKCC are powered by the CX and MX
rails, whereas on SM8750 they use the MMCX and MXC rails. The PLL
types/configurations differ across the two platforms and the frequencies
across rcgs are also updated.

Due to these differences in power domains, PLLs and frequency plans
update reusing the SM8750 drivers for Eliza was not considered.

-- 
Thanks,
Taniya Das


