Return-Path: <linux-arm-msm+bounces-93875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A2RLZ0jnWkcNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC871818E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67F093042479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356721F30A9;
	Tue, 24 Feb 2026 04:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2Qc/tDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/zWp/Bp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E910D243956
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905933; cv=none; b=UFRr8iBOZFG+9FV0dSiluYzpDdnxgwINjp/xiOqQefz6Wjp0pajptTmElRO5DiGQQ7ZwopvEtIx546JyVuHKhZuujBQBcrUx1qmkbfGyNkcCy8IQ2ZwJa+JuQYXiPnNRTulVpLexAzbhCwXarZuPu7W7lDKX0PLOpbTMUd/YZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905933; c=relaxed/simple;
	bh=8ZBwT4EPe13lR2/AQh2zOmkko0Y8KhzV6UK6F+MW0O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgh8WweAtrkmV2jlvsdfkQd2MizfoUAJDmFrlqaoa6jkf53I36uHyLdHS5nHc5a4p0qe8tlZlcXv/fL/GYuPpEmRsA7mlxLR9qugjn0GsuqHzBSJyMK8nERYp5+aR0DEnFpQDOOuDOgbaUUMibe0hl1BQi9t9IlUJRBLkcHxRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2Qc/tDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/zWp/Bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3LN4F1626456
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=; b=g2Qc/tDwAgJXL33C
	X6YMTeqPmi4apI/RMYDzJLoJg2AoNhkHKB4Eju1to0zM+b9WEdK8/LwoJK3K/HQQ
	eSyAklg5be0nwAGU4ml/DUG0ISeY5Iiih5R87lhdp66ydeeIgHbRnavAqzg8g07n
	Y/Hsc0I2g7dK3aMD37FqYaZC9Tqc25NWxH8xysTxKY9SujlZANr+j6pcpM+nUfP9
	xn/be/mI1hGzNq4krmUR6tFvIDK3cKS7VbbLq59Om3FhGOJVWAs6mDLU+kx2Mspf
	r6TqNMwqDdqtKy2v1FLAJdUnR94UieGa9N5yRuVZ3AM8qysemHcVDIquS+QM0xkH
	VkDnuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81au39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so5041341985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905930; x=1772510730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
        b=e/zWp/BpvSbn/UpI6HQ5DbQ8bKybD06UJgKt/K/B1rE/dJ8OjpP7wZcPOU5JwmkUfq
         mu1AW765Yh2Wl6l4qomZALaRWvTnFo73clOk/aZrW7M4rnynScqXrUzPaWO1XaYwyVC8
         sZSjjUcTCgpIi1U4LgyekfrlS5lWO7eBXk+/O7ScXGFvuehMSQBGpPFC/ySngrL3MOn5
         ShqUQ6UAwsL37ulVAmxeqtNSjBf0svADM1aOXjCNuJW/bMXxeqX4ViHuUdid2l3QWAmv
         ykqOqh+YnftVh6ZfgetTNEkeVzbXAlbueU772EJTCi6ah0JUC7oTUW8TQMXbZs6GxwAM
         TPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905930; x=1772510730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
        b=V2U1oRqrkIlRzeSCQik7FfgcuvBDoEXo6jZcZBLCDAaPSTj5FaXmZT1eufUjDLy5Bm
         RZikt9rS5T4TacJ+VY4BA1kabdtZGUFlnw28NHHa0qiT3NKJencVJm70pRWmZZ/JSBwM
         f2XBRAHsE/k/XrnRW9BPrYW1YVV5Mo9WnzJ3qBcaklMbhs81hKLpown5vET2VN0vr06G
         bU1D6/steqfaipZ4in0Iq8OQoK1IfAd9JLYDw9MNeMUdUCshLg1d3nUdYSUZGtFmlVn4
         i5UuP+egPDFOSlhXxr0y674itipyDcKr2X9LO2HVCnPxn1AjqCXRaPTv6R8mw4orRFuV
         rFeA==
X-Gm-Message-State: AOJu0Yw9C5OpAtNtBqaIHSJ/bxCWIpPR6iUanCI72d2lODmwuXoCVK4/
	plPZFG2LLa8exaEQx1SxOngIl+HjkRok9qk8oAKnQDt6hrghshEBGHDA4VPdvcJMdvM5TM0wDVu
	/6s2WQMRg3HyvAv3oI9QfMxG3+koWKrcE00TYOkjZRFBE+CM80bNyEoJA8ttaLSwqhIAX
X-Gm-Gg: AZuq6aJGhy3YAhNDEjtUg6Xb+Td5mpnpFx63FIjtqLDku6uyTnjl5fcXWSnXypOxjAa
	3IvZz1IGviD3MMgNUWZtQv6NFEoScYOCMFZEoLIvd2EBTVQCDWrgwvIQfMf0QPuel2F5C3t2WAC
	MqCqEHVJq/tPvg3JwXOJDnHXahsT5QdZc5m5N+kQskCBwyBhVWYXvH+Gjxuedu++BfFUksf5v9q
	Ce1gQZ73Q/4QhSQ8srv1XLNuze4eKj5X0N/avs7yCEMpG5pucufldKkX+gsvpxB5CrHYIvXFY66
	e8VK98NlriaDqDVt74E/y5i2E+ctRX6P2OYbqiR8mdV5cA4AjkIcH1379j7v2Hmd7N56TpS+BvH
	SD7Za/aKFAur+17h4x7ba5w9Z9xEPZ1szQQ2p2G/9Uicim+NuIyczlzR2lg4Bpm0Fx3nlN5AVof
	nKlnjK480LW+T/CkwWevBOFC9Lq0Rz3UKOGoQ=
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id af79cd13be357-8cb8ca6e621mr1163979985a.39.1771905930137;
        Mon, 23 Feb 2026 20:05:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id af79cd13be357-8cb8ca6e621mr1163977185a.39.1771905929554;
        Mon, 23 Feb 2026 20:05:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
Date: Tue, 24 Feb 2026 06:05:24 +0200
Message-ID: <177190591479.429979.2907662017829617135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
References: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3I_TaG6ROGkwq99apNua9pBhTE4_JUwW
X-Proofpoint-ORIG-GUID: 3I_TaG6ROGkwq99apNua9pBhTE4_JUwW
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d238a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=46aXZEyc5aAzpVtxjjMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX9K+1RXbKM+lt
 kMXGzNNXg5L/X5zEE56AkpAwaNR1x/hmvSwbnm5ZIKL3uFOfGTclfg7V00wkL6HWfMuimOonHIq
 Zvb55oX/PPDvQX9OCxqrol5V3ORzwNKQ0vkwmCkjaGsL2rxUyu8wlx4m7SbHFUJKYwLxxOn8FSW
 Y27E6F6Mk0GfJ/PNI5UvY1XTqQCfYbkLbk2BOa/562BWcI52Rxrb3eeyEha9kgyk5dRpOrT3+nG
 Nd77uA19r47Yx1efNRj5DDLvr87JLNFhm8XZB3mQp32MQjAJuvTx1jKYqxAybZkPb6LHr7tR7cF
 wuPpG5GYbwnWsZzRnV8h/aZrpdntE3Lso1tjtbE86YCYPlihYmvAepbLWFqA2iNLJXaPJyoo5kp
 wgWCOB7OfRFWNTbil5QZrsJoj8Ana3c3TNjfCwGLzfWo0e5bvEGxgEk7M9UDC6dDa10+TPOnIJf
 uPgm3Kapo3j3x/VUvqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FC871818E8
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 01:02:59 +0200, Dmitry Baryshkov wrote:
> This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
> DSPP-less LM first"). It seems on later DPUs using higher LMs require
> some additional setup or conflicts with the hardware defaults. Val (and
> other developers) reported blue screen on Hamoa (X1E80100) laptops.
> Revert the offending commit until we understand, what is the issue.
> 
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9f593419eb42

Best regards,
-- 
With best wishes
Dmitry



