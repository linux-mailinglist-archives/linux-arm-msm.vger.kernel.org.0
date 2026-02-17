Return-Path: <linux-arm-msm+bounces-93053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A2PMqQalGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9114934D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3B72300D324
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0267A261B78;
	Tue, 17 Feb 2026 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ejZRZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWOvpaX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91117993
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313825; cv=none; b=qzyahZEXSxnojb24B+faY4ftpIBtLB8tbMa0p+8nFxDCJUy3GTdfMKIieMRaMI59XuU9RMfcU6T2RNsAcN4yrgEnvnBjBdP5E0xXQ3XgQm5t0vJhyQlVYVJo+T7Zs/vcEtERtHu0VcPptTNDJ32LTyVrbaQosflnv23VK35EHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313825; c=relaxed/simple;
	bh=bm649JNZeV26nodFWhz70BQBjB2uTADIjYJ92op2J8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1H3XbKLLrbWlR+6M2CFD5E3cGDDxzcA95LkEtYaPqP590B9nSLGnVdBsnJXLzV7tJ88+1/ChUUM2M+k8qlHlkuljgaPNFIQli/XZ6robL5HKHYd0KYme6s1Lk1UR3nJtnoTWpCFgDXR+sNGBZbgPW2+sxjRJ3PNFoUIMCC1L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ejZRZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWOvpaX+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL8dBF1615109
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7t4M9jcxIIwiP2uTSN2cmr8C
	9cmLt1ut6OeHScfvuJk=; b=D1ejZRZfgLCZ1eIlaKbUOazfYcpgzo6MWTMxKVLe
	nrJX4PeW9QP8cYpxBvJZiV5Tn9tmSwkEUO252YkBbEx7qcnKNNp2TJkJgd+f95Vs
	aiU0tKtGvPYt5N8d463EahfRFrQYe6ewVnbchLKbl3odiT+QkMEmEKx3qj20Nth5
	FXpQm1g0++i3uWno69Q7zx88rJkDnGZ/g6Bf6vADA9FGIkf3zaA9Fax8s0L38vbR
	/LRTYLCdrG0ffhKdAfLStgT7x8BukrwrLD8e4ENB4GSacuAm07yCQQEFYH5HlkZm
	tXARp29wa39Ai8V77l90o5HrjhyQ8b4NAsg4Mn6jxWLrQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sj3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:37:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so2811033785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313823; x=1771918623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=EWOvpaX+MBUOeyWsWb70Pz/5pJqOGvUyOqI9PSdKeciHC36Qo86WlpZV9yO1bf28fP
         NdO2oFJuMsnlxB5w6JdEX13cAPY0P7Vr41ZGAhytrYQeUbk2YAQniQ5cBnEgrKu/dJNu
         uzXfFKShwubA8diivAc0Wrgxn3p+2A2YgbYjrSWjEKrFOE4/dG1vsiEO45eMRmnFyn/g
         o1M6OI2Qq1tgbxdpVDAiEOwtZnxSPyd3IPLPDfs7rTu0jPw1v998khSnhjTSfiAxj1ZH
         brvb2rMEf0fGVmaiuRep3KMNfRH80hNGnaRXls40TjCCW5/UAfmoVVHmAGgGJW1CioZ4
         OpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313823; x=1771918623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=UKZa/WCM8CmpLFyPttYo8gFTFFTy+LQ1UqitOLRBNV7j04vqHidvgh5ooMXStVb/um
         tHoXETJ3ro9HMlgyIVLCCz+VSNGLMNQhAaMy0a073ynUnCvH1o1HBrOB4Yj5N7x4TXDV
         tmBAesgp6avaz39xH7KDvstv4B3WHo3BYh9X9t3aPbVQUTj39n7GQpOgyJqwuATSMB9j
         Vs/IyYZRQws+c0qiEAu8DZaw5jeVrMuziIs2CZCpGlZ/XT+mVxnPRL29RJ8Pccn/fKQY
         KNSuGe7gp9L9jzSaOPG7FZ7FV8XY0HyShygUBhBlrQBPo5nGu3XkWsH9UjS8U4cBkp5P
         S2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlDW8bPohtHyG8rOAL6K5+MsQ8dHFQwCrSNAdpZA8luwJqLYsL0u7HBo8hDd4c3yqR7RsvzU39LamyXppJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVbcWsJBXuJfRhv21aZ/qmEaAr6aE+HfaITPrR86zks7FVR6z
	h+l/EkygOO+A0Cc8wuj75DSGkQ0cxwtdbb8dVwNHjCPVHKYzh9LNSmjGJ1sU/SZlerVtjWZr9z3
	hjGEMb2xXkLkGwmz58X7kEEqhn0LvgSLrU9HvtgPJ+qaGA+s1puSowqpxsJtbpoHTFMum
X-Gm-Gg: AZuq6aJ3LYk/HWK6g6rdo3B52LWdQBYsD+hQSQFnLmta5OE8UxirmM3gXxFd/K3cJ8a
	XoLGe9RPycErbuswAzxJMIFfq3zi0p5AoE7wp6rtNi5PYdz+5qCjWaz6CTLX/InkCFpD1UF9GPy
	Ldn9zKXSWQOxCrPzeAreHmNJ/wrOBcw5exN2B7ybHP3VteuF+TXULGqx3mLjrXQbWd4Eg4Mv2vu
	DYsMfsDGHDKPZQ77SUAxq872q9jRZZWeIt1G7oMAljwiSBIhUaWfhpBh/NJhBeFGxXSWNBHEwO8
	bL3J9csRaAf60OD7dhFpTEHHsps4aWFNDxLfXcjyEx+9xxJxwKy4mKQh3x+I3wI0KaOl5VduPz4
	FhjmqJ0ZmWJPlr4xZMD8YozZPNEVGnKQpLJRP3MOfKt2Z3bwP6UNu4q9K2IviaU57q4ioxvHsRN
	JVY2MTtqi66o66mkfqcHvWdEayVZZALe7p2Mg=
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197236785a.19.1771313823063;
        Mon, 16 Feb 2026 23:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197235885a.19.1771313822635;
        Mon, 16 Feb 2026 23:37:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5e11sm31662061fa.21.2026.02.16.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:01 -0800 (PST)
Date: Tue, 17 Feb 2026 09:36:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Message-ID: <r733gmfae4jae3zkjougpagyr2llx6v7ry3lm6rldvmpma6rcn@ebmd3dgvd7ta>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX0PQEQ+rNp/Vz
 YgZ176MY+OipHjEk1Sfuttv6mN765GNrkWKw1N+BkTmjsM/26EJtHvINOCXrIegBh8iMg7GPba3
 7dwDv2pEHVVR1oVtXcQiYXbTA09Ox02wHRa4dAxdA8zSRAUU+dcatnV6am2zY8DTKiJufhmhE29
 k259Na0J/n6zLl3RkYaqb8S6BZqWNKpNnt1fsMltTLlblycoHmjlX2d5GII7Kr7f256qegyEnIM
 Y8kSDG8i2aY4VvjEB5j7b9YvHHN1z7D9d3G9xAZbqX3FOdTbh4JT2G/IV5GoOoEDOn/SXlMSfiC
 WqOHi2Wpk9Qw8b9F/vj5ViPnVXjqtczAkKZXQM3+bMlBf8hb1lZc4IzM43vbZHJE4xaA0ooCJsy
 TMoSGf84N0UrgnR1rs3d83PPRLZieMZ77AZO8dhXKeXcXpWxVZiLFj8mkLEGbLGTD3rvK+hkqnW
 xuq0bd66ynHkkRfMZrQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69941a9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=GY9tGbHfO7DmpnXFqVcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OrQo2p1IQQ4GRn4jD2V8XFqph2Toldyv
X-Proofpoint-ORIG-GUID: OrQo2p1IQQ4GRn4jD2V8XFqph2Toldyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-93053-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29D9114934D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:21PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

