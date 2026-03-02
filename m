Return-Path: <linux-arm-msm+bounces-94907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kt2FhuCpWltCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:27:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C961D8571
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38DC330BAD41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A542235F612;
	Mon,  2 Mar 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0uMnRZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKE/XGq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E436C9C4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454227; cv=none; b=FZb46JPoJY+LTE85IndJwFd8m7sBRPisYrQ8t4HjIy+cY+WyO7jWXPNoWxRHj3n5d7BORgRLcym+kdvdQ9YnDMWJikHiG+/eW+E/vNwgoGEcMe1WtNYsjQxvfFBR102S8rR/F92obHxtbao4jWBNwVOmPHfwxFtWDey1BgyE6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454227; c=relaxed/simple;
	bh=rNgecyCO/KCYXNXKLtTPOfEzVBXYJJKmSH5LwBU7I0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZpZQH78LcePdOSdZYiodjsJxXA1YAjIBFDg8i91fXmt9FwFW5YiZULN/Tkp1JHPLP49OVHTu2nVEZwBGKxO4kNAt6oI2qI+Q8u1xBJToX1v1AeIm8KFSjWrf4pYr2GknJLEGOK0KKIIGgE+G/T/+stXtpqjH4TpGxRn3ehXP/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0uMnRZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKE/XGq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227maM9055870
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iakgtPa+B+g
	L4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=; b=D0uMnRZymHszqAH6SzGCM18q4Uq
	WAti+bU8PpyFKG1SR+dMkjk+1aHHBOl+SSG3gtUUJ6PmCaFzTy0s50GMV8Z0H8VD
	w9+WqddAO1lJ5u+41A9p98sKLgqXukL3ew+cALQsPJSDCootvhngVHfc8qQg7Z4C
	N2A8qghMk9nIGbb3GqZuZY/ZeNpFIDB171RXBA2i5c7eu1h9QKqll1h5RfG/ZwT2
	5xvlfnRevzzub2SRLxpjdeqDGe8DRzBnRyzs7L1ZxORouyoz0AJAkLtOQgb91xcS
	FflOwmge3sn9jA8+KpWcLcNpjm2CKHD5xj6GAQUSIRdCuw/p//jnpp/AqIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64aaar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:23:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2728362a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454225; x=1773059025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iakgtPa+B+gL4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=;
        b=JKE/XGq7pWUfkvPf+qagR1VqKGWg54fy63P9istpnyK/L549reipybeJfQKcWXMJXH
         VHe2jwVxvxrsj74/asYAWqxjK0i0zmMVVXG+14D/N0EgI5XMN5YlVGd2gCg5VNm5Mc6A
         EefBppvLeR9sLlqsAto2DxFvAlgiY2P33I+uR7Klsgit7hijNICCzxc9wJFVUsn3GTLo
         sPFZ2ujekYkECSIBU9UxqYgFT2GZQdigc0k88Z52/TxDwiM1+C/nncXVL5+tI6I1TVOR
         fnr/fHsgxquS7MIQVhweMMEOK0mjG6DT+chPCZJOiS47GPntZIjUz+akA6eFb7Bkl92c
         nxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454225; x=1773059025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iakgtPa+B+gL4j6LtSxSC7x2QZ9CUfgqR2ztBBPq1tY=;
        b=d0mQ9aop0AOchaC2YDKg3fkWCkZZTbQE1PfuPx0NB1u6njIR+5ROGr71aB7rr7NhCU
         iZsOztF8/0H1UsQIY1rUWHFn9JfHzeWA+i55Cr6B/o5rcFDqpYRF1GKQFMahdBMEnnn6
         l9tAWcO7CAq8ondzJoOx7/6nQQfliBFQDbLdJDO4PYl1zZ0T6i60cbPPv9fghdMl3L6A
         ypIWT6VA1GWIWhL1Uay3a4eaiaA8fEy0izATBoR5wz5mz8kzSCqe2kjF5dLUA9IRB4pC
         H0MP0RGJTJGemZnglZchQEfhAATIR3GnQtlfFVbfst3rlQNi2Rzt7fzjlX85rVnDcYGE
         hY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyCyDPZzKOYu9+r6WOLxY7Qtf61Re/sM000tdhS9d0am+FVoMWBeUFII5251tFPs5YlmDtqW27HkAjaRwR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LBMKjZ0zW8iYPxZU1be+B+X4L5hG90Kb2o0UCXTEm7DakPz0
	/Z3W3dzeT6yewhMkOYkVxXQZDS0Ki2KIIpoaWOJyJT0fWhHEcaNaFNBdYfZSGx5q+QfO2WcibdO
	Yt2rrRnW/OCM64LP459pHR/R73nyR8ZRYHjeMRqOgPm7rEgQoFE0RRv2TOn1c7/ze4ZGu
X-Gm-Gg: ATEYQzwVyTvFKRHXOSn7aWx8EU9N8nAcrqCH+Fn+LhYkeMNdlvaH16h9XcIYhSeRYxK
	AKlQEef4y3rx5OJFmsbpEMQ3cg92g1i5JMkAWqdzxq8mw9FHLnzsqWYuW8lZeBSkkESveByU/MK
	9BmbPM3axJdVMlU8DUbqjdTICBvlRGGR5Udbicycj5Q6tniAThf3pLQnoYO9oKGneEh0o6YaCc2
	QwSmW2C6PfU1JtEL56xvKiVbe86e9aNtr3OraoDr4c14ZSjF5mSRr/HzTsxaSuKH1lXkwvFZfCZ
	8seyJETIi4WqdC7TvYAlHGe2luntSN3oZnebO8dT0PLT2JgPLzKi023tOE/Sr7kOlSj1zLmZS61
	vo6XyvYxVlJ6RSedkLRxmQlZ07aBVnYe/p3xlmTfoNfTJ424ZhlM1
X-Received: by 2002:a05:6a21:688:b0:38d:e745:83b5 with SMTP id adf61e73a8af0-395c3a4875fmr12491422637.19.1772454224916;
        Mon, 02 Mar 2026 04:23:44 -0800 (PST)
X-Received: by 2002:a05:6a21:688:b0:38d:e745:83b5 with SMTP id adf61e73a8af0-395c3a4875fmr12491391637.19.1772454224373;
        Mon, 02 Mar 2026 04:23:44 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm11174698a91.5.2026.03.02.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:23:43 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: catalin.marinas@arm.com, dev.jain@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        yang@os.amperecomputing.com
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon,  2 Mar 2026 17:53:38 +0530
Message-Id: <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
References: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dhZVMfmgn51M4o5nTJSYb4ItlpbSi-Dr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwMyBTYWx0ZWRfX7zMUVLr5b1V8
 F3a8l9EkDUM/NSrkpkotgB85rZmEHcxr1niYPl+K9Bq584cCKBO1wFz8bqedvHbyKMi07zF8bmh
 ueDzD8JLidsjegf+VgperjcI5eMpuwGN0aWlkYGxQKUaqkMUIq+JZGlF1IJW7DSnSd8hUkV8wte
 d9T0XwbAiVzoBS50qsr5kwtvHlscpTiEFJZaaLWFMzWYRHa0RIYwPWdW7/zskc3JszzCRPi53qu
 Mz6i29ePwWZd1mFMYY7oFSX9vSlyC83TUcNG7lh6GjQHP40VV9ewBc0WTSMZyPwwDChFy9aER3Y
 aOaekLW29qewuQspz43Qm0kja+nNq/o8gLt6mEke5o9Ghjxg4Fty1FKCXEqbs+/JiT4rfhhAeyi
 vxJ5ANLMy4U1s3eujIuvDGn14h6znTM161SjbkU53vOXJ1ZdleKR8XXKmcFjTe0nqpVAHohuKWc
 XglkpmeEQRSyJieTWcw==
X-Proofpoint-ORIG-GUID: dhZVMfmgn51M4o5nTJSYb4ItlpbSi-Dr
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a58151 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Qg-vnJ1EYDfYGZ9COi8A:9
 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94907-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0C961D8571
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:23:46PM +0530, Mark Rutland wrote:
> The el1_dbg() function was removed in commit:
>
>   31575e11ecf7 ("arm64: debug: split brk64 exception entry")
>
> ... which was merged in v6.17.
>
> Are you able to reproduce the issue with v6.17 or later?
>
> Which specific kernel version did you see this with?

The call trace was captured on v6.9-rc1.

I have not yet tested on v6.17 or later. I will test and report back.

That said, the fix is in kernel/kprobes.c and addresses a generic
re-entrancy issue in kprobe_busy_begin/end that is not specific to the
arm64 entry path. The race -- where kprobe_busy_begin() is called
re-entrantly from within an active kprobe context (e.g. via softirq
during kretprobe entry_handler) -- can occur on any architecture where
IRQs are re-enabled before invoking kprobe handlers.

I will verify whether the issue is still reproducible on v6.17+ and
report back.

Thanks,
Khaja

