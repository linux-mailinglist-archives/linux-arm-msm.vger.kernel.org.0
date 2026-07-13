Return-Path: <linux-arm-msm+bounces-118736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9bf1IuLBVGrkSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC67749EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:45:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MP631YeG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y7RlY8At;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EACF3010667
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7755D3E16A4;
	Mon, 13 Jul 2026 10:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8453DBD77
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939549; cv=none; b=kUksYBbJZKbXpG7+nTGm+t58cb9Be+LC/ceE7+o0oknIlMbuyvHRjjLFvH3yOasPN86b8BSklIKSGnmLE7SQQVsmY8ZwNfSDVCdKdcut97VBdhfboaRL/mggGjA+kS3p3XhSWm/X4TaNOer1XAfd5hWpfvCBG3TvyaINEo5VFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939549; c=relaxed/simple;
	bh=fADMqcXMSC/Ew41QhBvx7o+es3Alyu06/NrBQ8KAO60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COkMk6CS9Ra0LS2872bGWeDeyxy18zR38ckQRm5wfkmEDxJo3N/KdHCPycdO9NUMA2bBvpEtA4ng6yiJJQtNGVUBwuM0RVBNFzyhKRPY01rNHWyYSPbu+Z0BgLDxTC/uqN7HcAnEZvl79xaUNfi7MdvjxatsRuEHeBvS1mSAUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MP631YeG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7RlY8At; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAZS2X668623
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=; b=MP631YeGt0YwkdFg
	Z9E0q/dqiz9oLvzEwq7BhyIDwtoS+hNNUczdWdKYrDg7WxTqoAxJ2HHY/ELWoigw
	zCDsOXZm2Y7Pvu+PN1kqb2u6jPRamGo+z5pjgDGeJ+yGB9lnYdWwg2h7qGShWANI
	Mc1D7KA5tEC69DqRukeDaTLnIs1YGvJ8X8l0A3y2UNr4AP1IRrqFWZ4uhqApdjzn
	7v+IbU9Pf7s5Lh0u4xNpvv8cCVifLTYr6DL07Ow0NQnJOjPXOx8hMlSa9REyRgzL
	mgM9m0SW+by45w9bDh/nvj+T/D347xhKlGVcaiBGF2N2N3y5RARm+oQ0A62RuV4/
	0ejNoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm24ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:45:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-901fdbfc3abso18229496d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939546; x=1784544346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=;
        b=Y7RlY8AtFSmHq5Ebl1zTUk8Gnoqg8NCXOQWHZ7+6xyDRRQsEvRHzeSBkBXSu3aS2FF
         1EFsfwuP8a4cRyYjrb7INppCn7IbJK2sRY2jZSXIpa/Y9/U65XXqe4YJFZW76YY5geqY
         sNMLF6Fs5ts0CXDJCN/Ay+FtWbxjHgJ9oJ6W0upvYRGkao4Gh1MnETfVZQ90808X36gD
         rV5uSmCwTHnU/myvFfMgdaNvTJ2N4tUxsgm76tiR6i+e+A5bgzRcGY4Q9IE3r2Fgy+Zm
         oD9Z1aG+mgn1JkS8QJmmtPkJGYsVVSZKm2209ts6eVCSsXMjOiI822WPtAWrtMnxAISG
         ozpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939546; x=1784544346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dclPyiXKhE9kf8fgUPzwT20RKnTx4EIwm92ppNGiSQ=;
        b=MYuJhRzEQn6N4Cp/ZN9FmRZ5BJnIX+s/27qYZryKQzOWJIX1QULPu+zdphSwtgizfN
         EefQjipjdezATd0diZ5xg3kstCKpefA95JzT8YcVZmoi2uR6/CfZMU2QMX3nlM08Am7T
         HsCkQ7G41xGNqPNF/cc/Cbs12TZIp28NwRpwVR17u5qgYHpn+XyMH/a6G5JAz5HoP6Yf
         UBb3Z9yyOay8ATrBNKPhl8skbcDVfMa608E3rL3KwgV+qiu/LWNRUTgzSIA4HqGPZNxf
         dusGqLRv8Ds9LD4srqC1l19tcfqAg/+9yN+0g5nHk97JIicgp9ijXOpvLsTDfGKaxnFG
         Mq6g==
X-Gm-Message-State: AOJu0Yx4MN9mYw2IYnH3dYD+bTy9DTwc3lt6E9rFROP3IV5CjIKHNLlO
	gEk9seFXoowSKUDcQFhQm3yPvZXjxqg6oFS0jXJDEN86GTDOLAoh1glIjnwM0msHabA24hw7L/K
	8L3DkuR9iYkivi5i9dclx1mgUsy6fhXGAiJwUj0yKbCzWyyPRCEd3IXJMjTSXxXFPEga2
X-Gm-Gg: AfdE7cnYPxkmsIj81XpmOHFVNJhzgdA+z45DVRx8DTlg934BrwdNwAD5mrE+N5EApn3
	hWOEJrtV47OAxCFlndP1e5qvvZrBKGjuIkVqmjjmFG6KcQ233p0C6eSwL78ZBr0L1kOiKkrt/dj
	a3nHjJy9cMbHUxao2RoS3lyaGgRXrbThFQs64G6Nmesfy52uQ/xnHeJYHyM7ZcHpyJN3nyyNUdM
	GSaHf4D4BgIc7yHB9turlbL+N1+bu+yVfhAq/Rl4POTtol9QsHBb8uWYBlA6/DU1RVEK3lbompm
	aZXoO619SL+G6A86IV5ns7UBQ8/tR1L8n3BTZPwWhLY4SXgqVwvPeAyfV71hBlttb07gPjvC6Zb
	JxNTYAWNT0S+BKDU2UdDVplznLa1N3zFHvPY=
X-Received: by 2002:a05:6214:509a:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-90400b8241dmr88673346d6.4.1783939546356;
        Mon, 13 Jul 2026 03:45:46 -0700 (PDT)
X-Received: by 2002:a05:6214:509a:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-90400b8241dmr88673046d6.4.1783939545990;
        Mon, 13 Jul 2026 03:45:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm14502495a12.3.2026.07.13.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:45:45 -0700 (PDT)
Message-ID: <4b710f77-f06f-4a2b-97d9-7c9b600addae@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450: Add mode-switch property
 to qmpphy
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
 <20260711-sm8450-qol-dts-v2-2-5eb2e86468c5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dts-v2-2-5eb2e86468c5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6-qFqCCQzsm5hEQNVb9dwG9rTrUl81CH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX+XDVYTSNrucy
 DzNZXSadB5hNFYtbgYDFu45sQ8019lOlgaTJho4OLEj3B5WizXgRcBT3R/ykn5tmbTq8RAyiqLc
 6FZoz+MMjubZbfM7fEY/YLr2k9wVqnD/qOqQNqvbYj3exIkR3K5vRM+Dcb5TiDtWCBGIFiy1BPV
 W7xC0IcrK+RLWHPGEzcW4SCoDsJ+J+p6Ox1oSiSfgDKr/PN/qeYht7l1Z+9vv8ooE8U6Ss99ZXa
 IsK7+d7JojNxrpUrthrcix8mWzPqUxk7xeJXVJKAxyoZxFcBDbYTxinRNoWmXSNt+6CXKYpSq+j
 c1ZSCKe9ORtNhMGa20wSUilGBQTvjcgl3R/vYcQ6HBOK1AOplmjGBYK6vlQ/DMtdR2yn/gqQdlT
 6U4nct6D6kOeeBrmtgWuJ+86NM8yP7fyPT8E4AI7dqYdAfKR7d/rtQESAhtWFrmDL0SFhVHvvej
 1rFZMMyT0YQ/qBpRuMw==
X-Proofpoint-GUID: 6-qFqCCQzsm5hEQNVb9dwG9rTrUl81CH
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54c1db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MPnVelzrJJpJSCPv50MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfXy9HyV58w07Vp
 zDMds3tvtLxYZmIaWZyY01YqucLx9ddF+oeTt74+dG6hxoDN21PgUp4f9F7pmKXUl0bP+/CfbKp
 docJ1ISqYWWSPjbHV0874DvU2zCL9wU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FC67749EF9

On 7/12/26 5:12 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> USB QMP PHY is a possible handler of altmode switching, so add this
> property.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

