Return-Path: <linux-arm-msm+bounces-106877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI1hIISqAWoMhwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:08:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9650B92C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72F9302D97B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6B93C3BE8;
	Mon, 11 May 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfTrO292";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R71ugVG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96813C0610
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493533; cv=none; b=IIcLnA9x2MDufruA3sy/q9Ltt3f/6AM4AL0vqgi2LYVMC1gcMpxCqiqZQ9zPJJifJi0xSxQAurX0A6YhtAS4XHKzCB3X0BBcFgqy/msZVndMhP6xhU5wJgx5JbFtR9hZmjDRK5oAEsBvVuyecR6anGbhwINsMGI7/xXKgjKVvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493533; c=relaxed/simple;
	bh=Y2OjlnCuQlb1NvQcRqlakOxq6WkVluCIr8bKCkZiNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNxXbLYfas3ZOlqW/pp0z1KOO+DSgl80Bix4ZFaBg3079RBMQwPVcEH3AG3oXGWw+RZ+rMgqlQV2DrXJMev0Czuirwhppd19LxidQZyN3lBYBunSIey0dSYZCEBhRlJsLjW/y++NUGDyDQqAsvarzxIyUqzKJJuGnjJc2c+XOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfTrO292; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R71ugVG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6Uac72334050
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=WfTrO292h1oyY7SC
	H4ICKr8oF7tHCFWjcH+eL0ZiE49TmC0BQpNU5g3PJfoTG2u8zWPKPIf5EYwAUVVA
	nt0cGR1qtAyZLliu/wkNcKQKtOiukarUHvykj6oScQYBdJpf9Kf0nSQhFJGyBjXz
	V8G62bC7lIXU3a8bTu1GP12w4zahouKasI9ExRrRxzLzb7uguS346OyNx1SBHCoJ
	lw0W+9ipN6Ldwx1Hotglj+Do2Y1Atup88qBQfFI5gux9derobu0yK/QQxoxjP7Of
	DBFgXdE2tVU7jr78yLxEFtofZ5dDjvUwN7HO0106vlN4ruS7JtzVZ710hb5j9cG7
	4s/fTA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79nch1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313443ffa2so200065137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493530; x=1779098330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=R71ugVG82566FOokZZIe0slLUCGspYrGMbf1yEBNsBzg1UD17npGGozQEJid7EJql5
         CZWO1A/xbMucjV76QsFn6R+VXU4eoZ6bmJSK7g6scJd5aUgw7peluqFbAL9BYiJDPUJ8
         rHZqtIbslWc/X3eNjWPORqw6CjD9uK34KBTKcDG5WtlVvPpczWu77fqhADIjwTuYVl3i
         AY7MCzExWPklyQyHDw6woX4B27Y+SNIDfshook16oZSF8sCyPz12iKqtPNd9KF/SgyK9
         zDv6APz/EeE/AlSnucEzUaenLbnIwu75pmaH/fk0Q8jpbSkIWnsIj9IAmraNLnev0Q+s
         OfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493530; x=1779098330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=mg6ckaFbCi10Kv07BsoCoUYuEiXdyLJowbTU2r1TNp5aQG40U2wEyqjfiaKm9a4qpp
         WSQBOHVH1BMholvdNJa6bjpu6OyeKRJ5RfZp/M2n9hra6/l06hwOjSHbpjYfri43ose7
         EVTOF0dx+kXzfD2Vu4a+q84RKjxSmxKAHbX+SC3TfJ4gxi/GlM+HM/x4L4sojiUul/2k
         /F8bgt4tdAjw4xax6t1r0bNXlKXjz9Z2fYriHxxBToWvnKAWs0nMBFQPrZOLUgF4Jyt+
         0j1fbXLNY3mbzOPAU6yQoik5dzuw8fwIxCgZlgCj3gibYml/Sq23iqmg/N6slC0dc4hK
         Yctg==
X-Gm-Message-State: AOJu0YwIOzcy29KkdChJ4OLjKlZLRVY6q1A4yCDoOSV4/EdabAnNf/r+
	JrFsy1v4tqAmkAfrC4Np7D5JuvTBzvTd+JO0mDL8h6C2qpBaMtOu/JvehxwKI4cRuZXmLQSBnLE
	QZ0sXFwau5tzSZeKZztR0uEB1N2CMmpQYM5o6ZSQBByGoHDaCKJaIf4I0dr5NSth/upar
X-Gm-Gg: Acq92OFGAwQ8tqXlysTw2qMS/Kp4MT6wxg8Oyb0O1nrxffQyp+6hJQPDWkWj9IfpZiK
	omgRHARqB1mJ9BvcGNCi2K0FDENUbxUNfur/l/YT5eYplhfazHhHBSnet+b+xNcuBzxEkO54G+5
	JeL5jG0/rd8E5qB3INjaAxqo12fx8S/hc/TMl0E8OjUVxI3mUJa132JgcVg8EtsB9dOPVJgBGn7
	BzbDu73We/97XtIoZZ/sV3sowEVDoh05Q+O8+CcE3fKsvXEwsQfwK0sL0ey5S9eQBjk7nszaGzX
	FE85Bcvos7g5KU7Tr0eisFfO6Rv57vBSRJcNKTshf+HcM2+BtTLsUZuEsRrE15WQRlnYlQQPJe9
	ZGeADNBrzEFPBGA5a2UCwLv8htBpwUo2KYiraO5/hfOsJEiBSzK35zFBEUhupti9Y+7gIsm+0ok
	WG08E=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451651137.8.1778493530175;
        Mon, 11 May 2026 02:58:50 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451644137.8.1778493529767;
        Mon, 11 May 2026 02:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468659866b.28.2026.05.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:48 -0700 (PDT)
Message-ID: <1b32c112-916c-4e7e-9600-e2d95bbeca7c@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bfjHUKTB7rrSlBwmLph-bpz84Fy63D5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfXxBl4NnhVRIzp
 Z/4htQrhQk8A8bJm9kNDShDhO8HoK2ZkQqdItwFEucjTtw3rC+Zm86zgRWx6npYcjkY3/zIjsIm
 1NJkj1AwZ6gNVapfVbr7IFNjX3IjBRZiUvrIwQzY79k/r/HX+2QQls3TxYryDZvuZPdIJdJj6Vq
 rucEfStNFouMALTHR7NghRRZ++S7nIw7UALwNV+ysoUD3ipVIJPfM5bJiBHzqPOIBQarGHHMLex
 x9MaSp2gtlc5tz/FXRIgYBE0czpX27g3E4E4sEQF+wJImaXbzQvjwhA10H91xV0u1zeIWxXuJPH
 aBm0Q9hWMMnKiFsr4nlMQ5uydVe7LRVuV/GOI0l42uf2EJQy9msUZ5L8iylGqK6zcxTSu/Vov1H
 1HHzp6ZNluBFdvNunsUibC5yi1G8GNInAVNiVhM957zRDJ56eV9QQLjfWnaxOTZ2r7GU6uC51t2
 bVJ8XTLUTUYaUL5T8+A==
X-Proofpoint-GUID: bfjHUKTB7rrSlBwmLph-bpz84Fy63D5-
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01a85b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GLZNN3U5Jx1TMTuK2tQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-Rspamd-Queue-Id: D6F9650B92C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106877-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

What about other regulators on that PMIC?

Konrad

