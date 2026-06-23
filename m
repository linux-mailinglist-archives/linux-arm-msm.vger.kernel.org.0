Return-Path: <linux-arm-msm+bounces-114151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DNbMBuxbOmoY7AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 567176B61DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:11:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kzN5Bekh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c2Ek287N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F826302978E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0458236EABE;
	Tue, 23 Jun 2026 10:09:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBC370AE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:09:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209370; cv=none; b=pEXBqfIYesopZC+kloKPfh1tZXHXbPBjpqzfSZUtW89BD2jHImeF6Oj2QXN606rn+huyHrbrp5iTvvSOIe2D2HVElUY8Utg9+8zbZ1Ia/O9fCuvt1WL9Ma1WJzk+HbixZFllBMQ3kAETWCEnNKCF29/3gbFYdlg0JLFaD2t9Eto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209370; c=relaxed/simple;
	bh=X9DXsCXcUguRFcOH02yhbRkuiA4xQ2ZmmuhftcgWaI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRh8bl4ugv+8TwXJ5FcL5uMYkmi5cA63hhLb03lkCFriaiT8RBTS0f1N34mch7QMSkB8YTvtvY2Y7H1C7q4uVCFO1RYa5gJBwbXHRb96BhU4LN1k46LyJMXPC8VBJHPHMIBYd7c66Q2vYUHABTFhB0Jg23u3lU3Q65RVZ5ih30g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzN5Bekh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2Ek287N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dNLh3631260
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9DXsCXcUguRFcOH02yhbRkuiA4xQ2ZmmuhftcgWaI0=; b=kzN5BekhgGjAn8ET
	WsiycQsJwo6YyEJJR8hoMHYYu2W+mFQQq7+gJ94yQrMCIHDn/zIqSALJu2hodo4F
	rCFpFc4mb8xSMijRZxAjW8JcyXSg3PriOLr6K8owObFrcCck37bRZPoM6HrjT6vi
	0SRM2Pg1bvdehbEDI96XtAgPtPw+QV2MktYNz8jnp9YDrXLrOGjMkBX9rZ54Fn2H
	lPd6IPYAqsW/4W77flM7RiSTleVVjagLPYweX9B7PnTBZGFNuI4ltcjzhBxEcBUo
	ZSArF+j6U2fKB3kjR8P/MgK7KIgyqFn3rP1HR0LRHil1clkPB+8P/Rhc4g8FOVTE
	lWDzww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvryc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:09:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423fa183c3so1024145b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209367; x=1782814167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9DXsCXcUguRFcOH02yhbRkuiA4xQ2ZmmuhftcgWaI0=;
        b=c2Ek287ND/30CrXF2hJuY9rQL5vKihZLDrW0S2O08quLqOk/bQfOx1isPkuQgyfZLh
         K/7z6+9aoO4nSpD5EwJjAtAe6fHPiR/yAtNf1DckAKjuDB8DDtYFXjswfzJ3mPWHinMg
         +Vqvtqa8/VEfLxuehN/ZrnKERgVlnxVxbzDDDMR4Mm++BRJLnxQB+VPxiAAJeqYrS9WG
         TWkQl/PR/T3fP89KrqTVSPVcjXiHlaMbX6KgxP8exOS4XuIiRkglcURJxRNSd1odmC0i
         hllzCQZDy04m7yb+aUAgURSYelaAiNJ46YwMbHYZ2mDTwk7xPmZ7kPv3dd3UKG9+452L
         sOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209367; x=1782814167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9DXsCXcUguRFcOH02yhbRkuiA4xQ2ZmmuhftcgWaI0=;
        b=SyPHORPj6VHqesty3iGp3ueoauFKqFz7JCxg9uWutZVH9CNI+JVc5DCAnSDXNEqSmo
         9o07cLSnAs+9zGPeaaJzaaTQhxmgKSfT8NHoxG+xiM8JTKoAQT/5+ZOLqlzr2PBjlsVf
         D5rOlvi89wC/qXjhUl/KPAyx6p+f8nx0xuvdyBuxG0ubEYZzm17u07rB/xHLWlE0UNyF
         EqaoRx/GCJIrVn2MvOrtAzG7QU4h7xMAwsAU1JTqORh9AGp03qoMbN/l7Pu8GPUElbIh
         01TJ76B/2QAYhCj7wxM5nh7ecX5vut/FGUNPQSNe0W1HX42+Pmj1TAVHI2JfI0dII+qy
         NTxg==
X-Forwarded-Encrypted: i=1; AFNElJ8a/toR7zJGWxCIjlXhunl2GPoLDMt9Xq6osbGbNw8rBBEyAc4VcM4m5vl8JFJceuAT5dj1khpmMD20e7K7@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXvEdOL5gx+egJ7I0GgYAO90+7N3PNRs3ITlhx9DGINE22H+b
	OeKbfwyQ8aGVl6rIb6f4hvtA9dqakeTzcngOKdFyprQkV2Fi3A5p6lddrmkBpVgJOoBL64pIFnv
	cRCVyOAlItqnukqePFJUuqGVdmeKSWe1c5v2PwMuQbzLVfrT2CfQ3aulHHQX/aRELtvJC
X-Gm-Gg: AfdE7ckihh/HD/BHFp98ebMgh0SCu3+RvGEaSOY2XL6J76wmkk7C8ZB9jlTuTVxxQs/
	DS/0i4MShM4+7DjHKPHRSg76+5wo42uoU5qCGQi2Qpg/SM2yZVoRfKiRnf5dDcELbE+bQXMpJ3t
	dK4mWsX244vu3vISvaGbH//cHDNL1mqhWJUB53iW9Riw83GmFz1STjXHUw60um56XMaJznryNAm
	jGcXEP/gQ65uVAbYfY24wrLuK88Qr+M9WbqFkCjwnTjRP35nVbNi7msGOL6urKeze+fLhV/OD5n
	wyi9J6JN8WTQk2sJ/0PXO8xrjRJT3DA43+sBBUwr6PKw9skNxO6Nkl8lXj6s7b/OZknCHzqPPay
	CRabPKevez83LdTuX5UpzIGVUcQVpWqSAboJzINDE880GJgvHOY4MS3kDCGDKiLLhuSotGCD7w/
	eBGQ==
X-Received: by 2002:a05:6a00:2349:b0:842:3be7:4d56 with SMTP id d2e1a72fcca58-8458f1da7ddmr2344679b3a.2.1782209366861;
        Tue, 23 Jun 2026 03:09:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2349:b0:842:3be7:4d56 with SMTP id d2e1a72fcca58-8458f1da7ddmr2344647b3a.2.1782209366278;
        Tue, 23 Jun 2026 03:09:26 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68edasm9701039b3a.1.2026.06.23.03.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:09:25 -0700 (PDT)
Message-ID: <b0da0e72-e0b8-43c3-b925-9a1b6deb924b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:09:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] Bluetooth: btusb: Move struct btusb_data and macros
 into btusb.h
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-11-11f936d84e72@oss.qualcomm.com>
 <CAMRc=McmkN=Oho2A+XWgvrRG3QfF61HaPkeCperSaiCzqOc1Dw@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAMRc=McmkN=Oho2A+XWgvrRG3QfF61HaPkeCperSaiCzqOc1Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a5b57 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7d7NGZtOMGS5_dLLPmkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MiBTYWx0ZWRfX015SjXwjDQ7W
 irydUuMUXJdhwX7O3vugkeZ8SpmTcGHbsYc3tX+IAZ596GTlM/4JDrDIZJ6qw34lEkeofXJMM2+
 A2xjNsAZr+JSt0HJJauMtkDz7tjDPkY=
X-Proofpoint-ORIG-GUID: TLsuW-Wi0piJfO-InMcqFOshc0-7SL_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MiBTYWx0ZWRfXzMEwlReE1fla
 2u/2VsWtBZUtUMUnn2dPW+YkKH+n32zU10tGDzPL//ImGA7RgRV8xbVK+8aykvE4ewWhgina1fv
 1I5NLaAO+lFoA5TzBpr9NB7V006gxo7C3x9+dzCwt6G3gaPnJCeCxUGDb4k30xWIGewmeYTa0+0
 0Tq2g/5mGDv/oAF0BN9ankuThyz5wv4CdOZ9LR5UhhL8HNnrbw3/+fmoq0VuUxAB/L2xFd12vuP
 7Q0Io22o1KqgnMltb3t1g2qP+M4qRAZ73caVEUJb0ELvomABN/sZDTU8FvLd3SYi8hKK43GscOG
 /sffCRNkB4b0CbiPDfyeW57NQ2oKThtEEPG5yoExtwvrjky6BuawtSgWaDL9q4oPZYrDdSpfm26
 PQxgGezz/64yW0dTDUzgc5biKt5epQ==
X-Proofpoint-GUID: TLsuW-Wi0piJfO-InMcqFOshc0-7SL_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230082
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114151-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 567176B61DD

On 6/23/2026 5:02 PM, Bartosz Golaszewski wrote:
> On Mon, 22 Jun 2026 16:52:24 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
>> btusb.c is growing large as vendor-specific code accumulates. Ideally,
>> btusb.c contains only the default implementation while vendor-specific
>> code lives in separate files for easier maintenance.
>>
>> The newly added btusb.h also reduces unnecessary data copies in hooks
>> like btusb_mtk_setup().
>>
>> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
>> ---
> I would be ok with this if you added a user of this new header in the subsequent
> patches but I don't see these so I'll hold off my R-b until you can show the
> need for one.

Right. Will drop this patch in v2 and bring it back together with its user
when necessary.


