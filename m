Return-Path: <linux-arm-msm+bounces-116964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kdwAAoTeS2oDbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:57:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2A713980
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ovvmGeRZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pry+VzXk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116964-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116964-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10A31300B9EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B38435AA3;
	Mon,  6 Jul 2026 16:56:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FF435ABD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:56:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357010; cv=none; b=cxBLJRM9EYb0bteOu2xOfPKRN3rF1MIquq+q3uM/yfUxZue98rsxe1zpWYHlrh4s0xxu9RdO6uiwIf5JRv/LpnnDuqMWRiASOeFQKUwb4ViUOj56ZDEywqCGkXNR57cjngskHht0MqtMGOX6t1Xhv1WiYQzy0Tkyc5WeG6Jw8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357010; c=relaxed/simple;
	bh=Gp9gRhqHhA/mroT+KL/Nv+qmsWbBRdIiJM0Bj3/656s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPxYgDx/GiHGP0nuPybtnqlrkpBEvj9/zHsFqh0D4r0w8Ui2uocrGwDeFlEebiUrw/Ia1PMctkp/DmeEykYWmJvwWBZeUOfGucm3alc80+d+KNq+UJv8crQOC2ERdQgsPA0VIn2tdUJtSBFODU7FG4kGI/de/zkBJmIcbuiVaPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovvmGeRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pry+VzXk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6AE947319
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=59jxAI22TJRL0Dh1Jvyc1De/
	oQ5JZ0dExzadshOF7vE=; b=ovvmGeRZGMFlIYrnybNY+oWWjfnQpELlkl+otXwB
	rCymcy+EClHImWC4OnZ4JkyzHqaVJsQovKo/IBNdSvMdDDKOGU/b4Dc6y+OY5kcc
	YbzxKPGYPHeWn2uiLrxoROPmotrSUuzv1q+dgOkptJNmievkWh/GDw+D4hVIu6Qq
	vAhfw/sNfhM8VwwCCIte186yC1p6H41VqK5K+Art1aOXdaYVybW4r5LQgfMtfJnN
	MJbg9/ahV9CuJgOL+jCnPA2/7Q+ep666xs+Oi1ZCOZj1zBumMKSHh2Vt4lGPuIbC
	p9R2RNoIgaZTHNlZRCP6pOTYGH7UmPhCOW1Aa6DJ5u0Tjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h52d38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:56:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso4745732a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357007; x=1783961807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59jxAI22TJRL0Dh1Jvyc1De/oQ5JZ0dExzadshOF7vE=;
        b=Pry+VzXkjfPvqsfYUgdZqlV4Ft94AUaxxJ9tvbjGz70D2n+Hlka6C0UmkA6z292nZK
         ybw1AoFZ7PcWLT8iMZLgBR9DVmaYAWdwoNmAQhd5TH+fqzNFu5IKUoD3U6tYqDHObLO1
         BuusICP4hlFF0UdbiRfYNVP0z8fVbBklbgeqZuGAkbrwXey0xbYWQzgvfXNUlb1QZkoU
         lSTOokvyi1x/70hbwrrg5TjbcyDgyM40LVFIfYePZeeS2vir0WXnwsgv2v0QdS3jLjmj
         rOUApbk/PvojvsnkC/m6FbVX/vOlJYuFxpPQT5q94VWdmASmuKm+k3OVuYLrt76YmoVW
         kpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357007; x=1783961807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59jxAI22TJRL0Dh1Jvyc1De/oQ5JZ0dExzadshOF7vE=;
        b=qHBkhLfHs8+1tnOJmPRgV2Yl09owyJ8LcDi/G6ZHNQgiKwppulWOO5X9XVsei+IhCU
         6sQxGAwb39DlgGkeKnevBS6lXcGdlyqub3gLjexHsBUeOn/JBhXQsbW3sjZc/+lBDAhV
         VpQkKtVPQPWsDxdkrQbniLXXPvkeo0Qbq4r6OcK+aSEWsnhrpNgz9OK2nQnfbr3cH7l6
         gY5FscAvTwmNVvhx7xa783U2G9/4yzyqSzf5lgUHfYVkxIMiXrp9WxKhlrPlXiiAeiAL
         LG3bi0rSKN7sqlLsJcREDW/VuiGKTYRlGxwq1pDu3gkYVkAVmWVNIJcJcYJAecXalkGe
         WRoQ==
X-Forwarded-Encrypted: i=1; AHgh+RohL5MQqsduP2GQtuTDv9nUsw1hacEhlX9a5DNhOM+T2p/5VjVvucVXK0Q4rxiPZkwlOyyGkTiwCYGEcfUj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Eoli/1s7KxW6pBwlP9ZweFrnh7+/gsCZUi0ipPrLBMRrGZz4
	CRxxt7RzdFMQvZOhCzgTym8+G7rLmNM9YfsJ0HZOK1slDbfP0zLwhoeWa/t2oUsAo5OInIxnoU/
	f8Urvo4qgFyBRGPbKEAnSO/S4BaFHEqc8/SplSe74RMj7xpr4uWXcWJbPiQYGnHksyo/F
X-Gm-Gg: AfdE7cndw2CbSqcG/dUaWqLPZmTLzyEsbhgh1uXS6hm5ju1OLJioCvOm0vo4NWyixms
	YZFTOZWwMzwdHD3r+oxBFDHSGBosIvJLUZz7VkNxXn8RUlbgEwh0kCqVfc/CQTPDVjjTNBdtSi1
	QJliuOrVMzNuKRjB5A/0+IzrsjzgRmvcSvZeiqY1Hefvc4TOaH/G6j9ee2XpvP8iwlnwQJUiVwo
	yH9T40Q3rRv75jnIWfl7MDR7fbYTgg2EnMgjY3UX/5rOtufLDXF3YVUGad0lTzLZqBT/76IdjsF
	5HWvVO2YNIVesIkvNOHT8zSFOI+ozPmg4p7jgBPSjbCymaTHj86CV8xKjrmZxbz/BqJE5gnTZ9h
	ykbDxyP+FZD5ucrn8BGPv51cBGNs5pJ/bzuhoXg==
X-Received: by 2002:a05:6a20:7491:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c08ee92de5mr1666344637.36.1783357007396;
        Mon, 06 Jul 2026 09:56:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:7491:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c08ee92de5mr1666306637.36.1783357006887;
        Mon, 06 Jul 2026 09:56:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3b252222sm37522653eec.23.2026.07.06.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:26:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
Message-ID: <20260706165640.ujq6zxcm2xjonytw@hu-mojha-hyd.qualcomm.com>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
X-Proofpoint-GUID: 5zBUdzxiCB53nHFsX4cjxQISJv8pCs1h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX32QVbNS9UHPF
 PrfXM+xpt5Prlp7pdRjjli38LLhgp9mVd+8Id+CYs4CBYNA4l19TNyFKz6j3SPRZMaR7UrQ4q+v
 A60WCZyj9skWgViv2YcYX9tKUKkIcV4=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bde50 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qd7qWWBmuhcpzUx0zIEA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX23wuLaTzy6Ym
 Cz9nmGQgJaw6Ux8mOXB8Nn36yYVyzH27EGmLbq5tzV7tYRuBWyVSYxoa6l/mhilP08CmAqM3I1C
 CJ3xRswAV3Lr0h/qTBL8kS00PJDrXVLTn5fWVHFlNhh3zLZeQ9ZwJaqK4UxlxVFhQNZK5EBG08Y
 RAp2uARXrfO+rnPC+ac5u9n/2KiQfQCg3IoallXkc4Y8thx2jIxD7GryneD+vOgYlEIP6kliwh/
 mo5KCYnDZS8lmmQKSLqXe7eQbxS8pU6yzTyTTGTcqqU1yEZHoBfIg1pqSJDdk+Oilc83/Lx3EF/
 jEU0aQR0+INUjnKumqHmE79KTuxFIFsNC9vyhljC2X6d5pIlDT+8bD8w51PWCR5UBOiT0nC2Z+Q
 F9ssNy0gdTduSDUG3Mg6nYRmw7GN1L4X6U5//YZUSsW6PuSh9EjdexPyFJteFjz+rLXQIX0KvB2
 L7cR+IPSjGayT9P2apA==
X-Proofpoint-ORIG-GUID: 5zBUdzxiCB53nHFsX4cjxQISJv8pCs1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-116964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,hu-mojha-hyd.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1F2A713980

On Mon, Jul 06, 2026 at 05:37:17PM +0200, Stephan Gerhold wrote:
> On MDM9607, the modem firmware exposes the QMI subsystem control service
> with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:
> 
>   $ qrtr-lookup
>   Service Version Instance Node  Port
>        43       2       34    3     1 Subsystem control service
> 
> Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
> service never shows up with this ID, leading to the following error when
> trying to shutdown the modem:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> Set the correct ssctl_id to allow clean shutdown of the modem firmware with
> the subsystem control service. ssctl_id 0x22 is also used by other
> modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.
> 
> Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-Mukesh

