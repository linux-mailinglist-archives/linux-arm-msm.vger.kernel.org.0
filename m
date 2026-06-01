Return-Path: <linux-arm-msm+bounces-110608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BzqChyLHWr5bgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:37:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC52620240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46A3F305B981
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFE63ACA51;
	Mon,  1 Jun 2026 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAAJIuOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QknbIr8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5773ABDA5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320838; cv=none; b=JyxfJLFCRZuC1OaesKueJkV625vE7a7v4ubGV0h+8fUjn4jYHn3CX5TCmZTWhnUABarkkN6ehHKViQtwbqpek47J2SzZTWVi7oV4WL6Dk2MSY9IMJmHnTxwTBg4C0lc99waVwh3J+VYMw+2Gg+oI5GXVSl0EdJvtRvQm3ha0PRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320838; c=relaxed/simple;
	bh=Cd+q+iCUJAhmTXk4ZiMFzYTOTF+0kJunESAfCcd5L58=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=On0Mevr3e6dH9G+ua7N0QGA5gpKlQXmWeZ+WKURE+/XEREQFCNA9eRikMoYhkV+4yzMSNQcZOJAQsJirAt/B8ww3yt+TNFSkTGGjQ7K91ZLqfj7y6ZBdN5lCa//URpSuCqTv6LCjmb3/UOO442mkxWS5D0/R25z49L0QBzpsvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAAJIuOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QknbIr8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fEIC1257502
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 13:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=; b=BAAJIuOEeaJVIFmx
	ZoiVb3vtn9PbdzSKpgtvXR0moCOicWe6066+2LSLxTW8Rq8tXTCiku8aqzBU6zcq
	coT3MOeIzgqWyMvz5er7qYoNqeesy1Q7ehnkLklB/7NTeB5erbWYgZOnCUhvqoNA
	C9Wg2NZo8Z4tXlxv00zRKu18X3zFdFhKX+eztLEE8+au54yjW0FSHvJKZmozGzUk
	LebgRQFYQm1zbOBvmX2b6m0dzj5pBpAtOQ0fkxeG/jGgixAVZKTq9TJIJiwAFoMb
	mOrT07X7pcuTJr3yLyiFQZYlcVOvttY1802+dYbltBhjje1AsdZwx27y0y8cTvU0
	LlXjpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sss5kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 13:33:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842446a3851so679604b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320836; x=1780925636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=QknbIr8G7MRTABN9wJd7+9IBope5XkzzhedFJywxQ5inByGVJAZ0Aq5fWCDJDx6tyn
         VttpJe+plwrLDWdkngZiOIjRNz+YXloCLGyx2kFzLatMrK0m6JFSn3HtG2VcXnIJsiKd
         jAj3gLVHrvAeDcQoM2UxXHiIfXNqgrvAbedP9tJgt3JvQ3sDtCNzaA3h+vMzh2GvyivC
         dwySTEWvnYTdL95uR1+A4KY6OQYwyFV6MsNqaVKN2VGKqyw7dyabzMqSYsnJe+ypw5LS
         hkNV/sbSGfjozlWe1wLpq+JY8poELuTuwPNe4ApL+T+l6RvpG8iPIzGJx44MmSsSfNWQ
         HJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320836; x=1780925636;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=YcdcGsoJe+38ZxoiOhx2hpzl1rtZWgpX+/WcB8Lygn0gNOlgfyDj1Ofv/JFOUR7Dsb
         qE/BSClDei2zBy0xuTcbDQsqEJQGl17bOyyPC9NIxUmSlph4c6W1flqBDHtMNcRl7/aD
         JH6REB6f01JQlj4m7Q0TYiAGNXtsh4WTW8sV4wtzF1XpyrgmMzb7nLycs/Nau4J7VcCP
         yWPK82C4NnXbNtmV4Nuvl4mADOJ2Ewtx+uB64r753myI0FX6EDzyAugOijMinbN3Rwn6
         wdvbSSWMJ51jixClkTqMXK/eyt3U9cWikihJHFv4b47biyMaAXC1FD64NjD9O8gHtkLy
         HHAA==
X-Forwarded-Encrypted: i=1; AFNElJ/8Wv3gJIRS85veGDCXQsOsUM+WIkpJtxXUYdS49qnyEnJF5J2RGqOKKAGWJ6c+T6+fX9UVlR9A2R5PU4nI@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUU9HdbHpTsRx0SOJY8xw9sDLPEh9zYSqypLhEQQDwmoZnq19
	0c8iqAH1N8goYAEvSF3C4GXUhBz5d/qzkG9DTyEoX2YDhhnpZYZYiPbVQAuzso1xDP6wBSM9gZs
	r2q2nW66m6AOFyDIuOs3OFU2ZzBENs9bcLZyG84ZRDRp25vM+krncKZXD6kXFCTlmGDWz
X-Gm-Gg: Acq92OF7AnL/Lc3P+treJZcIQMu6vGZ6aBw+2gGxFiJ8mmo9GUYsPdFhK3ZT/mXwFGQ
	qN0/Gt4QxYUupCnTZgRGe3xJmCWTxDY/fWZpj1PlIFRlb3HRnxUTokSvGR5W0a+ekmdkBRw/1Z2
	MyrpyUoLDeC4xRfXAub1ezGH+iE/jh1ekGKhMCMaKTTSZlqDzVbiSd++8Mje5wsv4smfv2J1m1i
	3o4fThnixbrqn5Hz/saPw8jFYmh6rKTdVPiS528ufiTb073cMKg2OzHdR2MZjII8k8JmmEH1T1B
	l/Kf/5z4JPGB7Pqt+Bgvxs3NhQQXIlFCa6GBDdqS/Qkw5oi595a6wj6WQDUmu6ozB9is1QpfD+T
	xplZ6KCHbziFmwb7oS5k9yNx504pt1qKlD57Pq16KpCEU/gtIdM7IfY6mzobYGg==
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129401b3a.0.1780320836202;
        Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129376b3a.0.1780320835731;
        Mon, 01 Jun 2026 06:33:55 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214d018fcsm9858622b3a.60.2026.06.01.06.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:33:54 -0700 (PDT)
Message-ID: <b88ae6eb-6571-40bf-a668-b4d85418cb60@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:03:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
 <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Language: en-US
In-Reply-To: <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8YCfYxrLvBWErPXjkB9N6qQzTqPxKf9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfX+XAUFV0wTTIj
 0bLX/Fyjud6l1VWx0l8LuKFL1w81mvY5JCUYMuUxQURmD2h+JI1A1MgSV28bx4XQburSlZizqp1
 jIMauoqP/NQtHRjQglRPS+zf/v5EW1XwKR3DZyl4G6OtKzDv6zWoEX6ikBj+xcNFWsjJL3cq5nk
 LnSbh4oAqCFwTQ8cjwvFBpiKWywheGz3n64XKMXX1J35/vf7fMJDlM9xvjUjFx/sE0Z7PRECada
 tCaZh8aO8iq9mmCUJHZpPsgg4fvPxo4ws12EJWuz6fAhKvc3LPzYiw59OS/UEcUh8dWeQgd8r7a
 8o/5CJgJx/2/skgQn5+brL5enLocDwvYuPrnRELtXWkwiytuaD69luKkTqaT9lbGGzJOFbXVcSh
 TAiFli9sRK2Zeq0fH2MDatBskMC7zhgNnBljCGTU9xHGkgsZAc/nl2MALPKw8kPf0lJ2xzaD/49
 LVWUGyUubtimUYPRFfA==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d8a44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7s8xYYrCI25hbqUs75MA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 8YCfYxrLvBWErPXjkB9N6qQzTqPxKf9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110608-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DC52620240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30-05-2026 17:57, Krzysztof Kozlowski wrote:
> NAK, this is getting ridicilous. You add incomplete "compatible"
> claiming that such change as adding a compatible is a complete work,
> complete change (as explained in submitting patches).
> 
> Then later you add missing description of what that compatible means.
> 
> I could not stress more how WRONG this approach is.
> 
> Stop inflating your patchcount.

Apologies for the poor patch split.
Will squash patches 3, 4, 5, and 6 into a single driver commit in v2.

