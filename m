Return-Path: <linux-arm-msm+bounces-114141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lvh1FvlWOmr66QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:50:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FCB6B5F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:50:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QFvXQz95;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cEYPMiGw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C7273004D05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA115367F31;
	Tue, 23 Jun 2026 09:50:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4A367B86
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:50:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208244; cv=none; b=dB5RpKRJ/Ta6PEl1GF3470k9vBgxlODSW5KgaygCyiV//hnXja2nkgquZNgaKafsSmmC4NMwcfLygMwIpR66LQUqk/LBFrPnEXElk3g26pkbNlyR7vucbZifH5r7igfIGqawRlgP1hazfO9HhXyODxY9JQKBaWAbW/Uxd1gr0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208244; c=relaxed/simple;
	bh=RhUUx6BUaYkSBmMt0zOtLbS0iKXmm1tQVHlbLjfXbFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfPd2ZInFQPas6jR/Ng20o1GOybR6Nm9zu9oDB2PAiqSy44/clYZlV9/CiVVIV7p7NJdqKhYdGAG3rZiL1mKLhZF39AjucsXe/SLo/zgewDWEWCLE/+uPVveBwQENYK/1myL88DegvnxwB5tuDAuOOGSt50pEWhD7ShTTH7A1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFvXQz95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEYPMiGw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cVjj3338247
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilriAldCns+2pBLaSJhYKfD8whI8LAAJ9S0Cr2Qrx10=; b=QFvXQz95eMIHgyRv
	MTFGIKxFs/PnBj+duiaDJtG6yz3FEDZZrPUHOW+lkPqzyVwObiFtvsBKkyEEicT8
	sBs/6bSth3QdcvuUWsOWMapUJts4mG3glyyT852FL6jxHauK8mpnU237FgfvTEUz
	xY8T6eikglZeUIWd4Kd646UljOsX12/bHMK2GdbMp3MNY0mzWqbSQMDiGPWKkvKj
	ljYEIOJ4LhA24F9+mBbuAE08FsIaahakvUOOIM9db1RJ1K7nI6eX4Jc2D4F2DA/S
	u78B179vaQk4DefYockmJccFXym10CteZaXHR0RIJv9N+Js5J40Djibfhb0bpf7N
	uD78ZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhpfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:50:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453ac2fc8aso102747b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208241; x=1782813041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilriAldCns+2pBLaSJhYKfD8whI8LAAJ9S0Cr2Qrx10=;
        b=cEYPMiGwRF95p002HVCMGeK+XPOHk2G1HwBXc7srj8RmUsqegP4qhydKOo3J4e4I01
         MK4+oPLz0A4hOxyGINQnwfXTlixbIOyZFtVg5zFaxBXzFRVsJpbYxl6B15TI8OiUR4dp
         r/W5cm0Wv3FLW+wDyZ5gM5rbL4JvYeFnpnyaMcdXKG5z+FG8pIpe2/4In9jM5j3JVOKJ
         ajel/f/17X4mMiairCOIISVo4wfSNYlYh8Uq+cICCzzaogeyrw9VxjDZANelPe6YNcO8
         IcDrWrWDFkFrFEjOpnn5ZI1XsmnqBTJzc3oit2dmQK1AJyQRT92M+oyWtnFPvqYesYJ3
         yHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208241; x=1782813041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilriAldCns+2pBLaSJhYKfD8whI8LAAJ9S0Cr2Qrx10=;
        b=GKZjHhlN2JmbcN18O1orakuguWjzl1QZGgvie8cFQA9TffYSpkJzK98xgGbw4bZVxn
         48XMEo6+obW+6WKY6szcL+J5kx7wQ/JfIOupJLTVwjNAVTv3Jx8OJIMwyAYhZjrbpxeH
         2189qLbXAOS6cv9epAP85gnq4VATgAgD5etjzEAFq/rOxPhQ9fHKNyIxJmVUV+3rfEDg
         DJ3qPByBuO8a2cosyedSupqRX7+Wyymi416pZK5+boV/Ebzn6XLKlPadEHpJxsmaShIx
         ZvptFFESKttVilSSTHvjjL306kw0HOYjBLb9IMRlt1x0ifg4kD4x2SPsUWbUm4u6zAXJ
         rXDg==
X-Forwarded-Encrypted: i=1; AFNElJ+fjldevecp5Qs0TPnW7jhKfOHlMo88HfvF1getcKHasUidG72eT6c2UaM31J/M9raPblVr0ILsoDAARM2p@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7Dj1cOHjxEMcqEQVeeW6XOVxQRHyMPQECAviFvHc0SDR/kHB
	U808IiAL+FUJ/YgJMJxmuXJpNRteehsL5chaiqwSP00Tn6XLO+xYre7ru4db/0J+EGhjZHIhWC0
	NKAXKG7xBK2YG+N1p9Yif1GG3ou/+0+v3FCHRkkBWiXC8ZJfqg/Jtgd9P5VmRPwORZzf/
X-Gm-Gg: AfdE7ckRzdD2ECk1Ccpf2Yk2uak//te+07p1gzRnMgCFSumKaYytO03qkGHCl2xqYLC
	rwfHoY2tq9Yjd+jBIEV2XasWOmzG2BtGc1Ev/UTE7K5W1QQPLlc7mv3HVl9LIpbFTJOhsoVASOg
	SVf85CmlXkCDLA/ONwuCtpRJPG8q2crozaIBveHqxAe1FAMTfeXDft9sLebBAloWSkC4c9mQQoc
	i+u5f00ePupWioLtQmEYiX8yuoTwvm6dYSm3FFU8BVrA+cQsezshdQ7p6On5q7Jkg33Dw2P1J02
	SOTQQkK9o18x04q6Ul+e5Acyq6NCuTpGfaOHeGGuaPE26zcIGp4O5tJtNYEGiQGC84+HAVluVY6
	CqtcRgrDGbQvLcbXzhHCThyV/TorsOn0XPmLDX0L18TD56njj7+A+/plnPOaxkGzE0RNSEQ2FGX
	klyw==
X-Received: by 2002:a05:6a00:13a3:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-8455fb1481dmr9502019b3a.5.1782208241532;
        Tue, 23 Jun 2026 02:50:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a3:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-8455fb1481dmr9501992b3a.5.1782208241070;
        Tue, 23 Jun 2026 02:50:41 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d89bf2sm10016372b3a.16.2026.06.23.02.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:50:40 -0700 (PDT)
Message-ID: <b9e649ce-3306-42e1-99cd-02f86d77d200@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:50:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] Bluetooth: btusb: QCA: Do not populate devcoredump
 fields on ATH3012 or QCA_ROME
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-4-11f936d84e72@oss.qualcomm.com>
 <l2ri4yxwtxv3r2upconhgsblespvushzeaqcvwvqulracmvfr4@qsmzp36emi7x>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <l2ri4yxwtxv3r2upconhgsblespvushzeaqcvwvqulracmvfr4@qsmzp36emi7x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OSBTYWx0ZWRfXzBq3AbXq5+SI
 UAXHwOj2Hj1fhZZH/SZPPSFPwW0PwWkQMGGlW8TwQAdCSos/rUIHR1J293clCHfW+mkmcDASEFR
 ReEEjpqQGWghXjiB5yj61ovOinFJJwsZfuL/Yew1Xihvc17VfZK3yVNyhv7x5rJSVS/zdf+VqFf
 zbC9dC+7j1Dqn2USpLyMZBI1emJTBCwHHPCBRqunXFzH0KwNl83Pdn0qJjngYkeJPy4xWnit3iE
 p1krao6ukqP3hnxsQDsGxJdFh2jO9GPRHUI9UrwE3NGaHYZ+Vc+wDlvei7tC2YqLfHub5BLxd4I
 7XL8SwXHeKcxiENys0475EXeA5IZ4AHoMLU+WQZoP4GIEHp2DTAzYcSKuzl2F3attzVZ38oEndj
 NU2bAdMjIKufXxlqV0G3Vy+zHurpW3SinZMabdt+z75ie9PNmkEom2fS0aETBL9V4jI7VbxvECd
 VuUZvdPHDc8r/7j40tg==
X-Proofpoint-GUID: myxDyvZDUSoNWm_eWzSa73lcWMc7-ChI
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a56f2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=r4DXEafDs6yR_N-SMUMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OSBTYWx0ZWRfX+c9U2CwnFN0C
 EweB8Qd0gmUUcpQxXHbqWi7HCVbGNBTwuoO8LLZEJYMnTI5wmqFc1vUlxtdt34WAtMSS01dl9zY
 +yxisynlWtmC3Bjxih5in6S97vTutAw=
X-Proofpoint-ORIG-GUID: myxDyvZDUSoNWm_eWzSa73lcWMc7-ChI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114141-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58FCB6B5F14

On 6/22/2026 11:31 PM, Dmitry Baryshkov wrote:
>> Devcoredump is disabled on ATH3012 or QCA_ROME, but btusb_setup_qca()
>> used by both unconditionally populates those two devcoredump fields.
>>
>> Fix by populating devcoredump fields only for BTUSB_QCA_WCN6855 devices,
>> which are the only ones that enable devcoredump.
> Why? Wouldn't it be better to enable devcoredump for all platforms?

BTUSB_QCA_WCN6855 marks the first generation of QCA BT SoCs for which
devcoredump is enabled; all later generations are enabled too. ATH3012
and QCA_ROME are much older chips that predate devcoredump in the
Bluetooth core driver — there is no requirement to enable it for them
and it is not clear whether they even support it.

  Will optimize the commit message in v2.


