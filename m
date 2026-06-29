Return-Path: <linux-arm-msm+bounces-114866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wm44LrAfQmp/0gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:33:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E46D7094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:33:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PrsjYO+b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XoP+BCXq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 912BC30013A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE62B3BCD23;
	Mon, 29 Jun 2026 07:13:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A43BD644
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:13:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717196; cv=none; b=NfiFLwcuhJNY8wGCtTYHGZETgiS6Ck0QdFYV5aXLABACd/2u/eyqPKXq8ruCtJjO6dQhxaKYq3tJCH97v7GU7LQLwuL0EWdg9eRhI9GkWOey02VcxFWLhApauaknhZ/JStNfy57XHsJJjkTq066RvuJshlmN5RBGGqBHfws8JBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717196; c=relaxed/simple;
	bh=KZHUaZvEKFxXtS7kRf+MZVbK87nbFyB1YcBL0fZT7sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNsXJYSUc4qBijlk2tfl4fLxeCbT8miD0WpsKCIppD2N881pgRwNBe32bfs2rwQvNcM47IavZ137f9DnEL+E75XWK+/ubL3o06UeLaMo5fJM5YJa+cIWL6aiEXozAUCIIisU7WN9hXvRmY/6ncruvjPwSzQhQTI0Y8T8IkF6+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrsjYO+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoP+BCXq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6s4f42103947
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DpBPb27RIWIwXmB/JzvE9Nff
	dB3sd81CybJo2XPwfZA=; b=PrsjYO+bFn0aUg7xZxYo9mcccrZ2ffRVpawmmtH9
	SdYyX78TcWCxyE58uEq3zmWsxg5KbFnDcARD19BqLRuhLmkF2NSnNEwIKU1JTv9q
	A7ex8X1GKgnn0+aPysr0k+QJpnoSAsbLeJCcr76F6Nfxr7P5o3hy2+9kCV7hocy8
	mtrsnfHJ1nSd7Qa0QlBiIibdKGzlSGNxPApQerTu+v45nTjqxR492DVYmXArCrTi
	wxSGixsiquzYOerCEvC45kzNzGZoMigxS1FKmYQ7/k/0ytZhXA5mzfFjtPZVhfj7
	d+S2C6n6CRvzJDKHw9a7FdwbRKlsxcyAxvTsD2pUW+TFCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cn30w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:13:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7cfa17fe6so46431155ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782717194; x=1783321994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpBPb27RIWIwXmB/JzvE9NffdB3sd81CybJo2XPwfZA=;
        b=XoP+BCXqJzF3P7vAZmds0iA6lTGoIjMA3f/eoEpPfuWzJQvtzt3lC1YGm++9ZKtxQ0
         bTilcWqYJlkw6kg/YTmVf0q869vCi34n+Z3b1SbzQkbnpbR0X4MYaGgzT/309Fp2j4QW
         XIY2OWwTEeejPg2W7LjyFiavx5hrHOy1F85Js7Jrx+SHImm1/byQQjCswykkn0/kqx3H
         TBTuTA5r077XuRjSDDcsmBzavp6zoJBlB/EnEmAM3ik80wDn/+Xg1akw/c/hbv4RXFx3
         iiSyT+eOXMS5avgKpxVoTrtrJ507ZGbUmf4lwKovGVXsKZuk0CDguCYq9whnt1Bdg4DB
         t8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717194; x=1783321994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpBPb27RIWIwXmB/JzvE9NffdB3sd81CybJo2XPwfZA=;
        b=cyRYl3wHAvM+FXEu0ns3bevA+Zsotw5bqXN+Pcx5jnujFCh3cqIqthJZgt9A0LEeKS
         UrfEWfNN3QQKdXq7/hW4o6M1nAuh21qRAiPZhqrku327qhELw/zYJByx/niN61+d4fMD
         fO4fePYUUhmLwnwUO/M5KKl8kuKOfl6jO3Ui5YyziSBQBSpIjaL7k7HNtsAZgdb1+n68
         2j9PRIesxIsDS2Ev0SlLU6pQx1trj2jT6WcbhKQrvciTTu0QAFhbiuK66xJaqnt/tXzR
         CZpQr//lcm7LzG+maTsjnOPb71eEaHkGbnzjm2AYZF+eDjU1rXtp3KEqLmBWOFcKk2BJ
         HBrw==
X-Forwarded-Encrypted: i=1; AHgh+RqeSFtiv78Uf/fnPHWrqon6kKmldP2KnkeD5aae0+OlEHe0p1i2PB20Wslyr7DhBCHoTxiLgQ3i0HeTrKQH@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCn+XsXEYVmLlfcIg6V3OSpYAf5Y3nWS3WWLixoHMcLjEH7xV
	8vPpNC9IJFAriFhqZ4m7sycu9UpUKYcpG4kqQpWmppsouWF1b083wQFn2aUvh+GDuR19o+elSVx
	jxXznfocKwp/OHW9SqCLwiYfoV1c0QrKI6XlQpSf1gYLbFTwixfq8vdltnhvC5OAFF2z2
X-Gm-Gg: AfdE7cm5lmy62vyhjZlT4WmCx8UiATOBFuMhSGN3G9CSUvmaFlXt4Xt6hMAo+VEQE6X
	ToMBSuDJjRrQbZrQly05v1fLWt1HRL+2YxSq5mnWCmRWowvVEbfavz4eXhTyzTw2PLVUPVfHgVb
	sJ2FmqQ53uuU4aLg5JAoQCvmYwtBTqs8ueN42P6Q1aOynHC0K19gb9Z5PozWLJtPnmT620PQ1G2
	kstLhrm8ln0fKwaKAULJ+AQpXAkpyXNTFQf/Bd7ndUb/bxRcknOFqVqrlxmc1wL0jFuA2WiSCfL
	ST4BZCl/2HepVvaxVTF2pjHbBVRPFNs0pALx4H91qUN6SdtmbE90/7bB15trnAXm1U3tOyiZY8d
	RqyNgmUOqwllTjPVg15pS8DrexCUz9xe6NxFbfTYScwWh9g==
X-Received: by 2002:a17:903:2b03:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2c9b3961fa6mr64038565ad.12.1782717193881;
        Mon, 29 Jun 2026 00:13:13 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2c9b3961fa6mr64038315ad.12.1782717193458;
        Mon, 29 Jun 2026 00:13:13 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c8255602fcsm54177235ad.60.2026.06.29.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:13:12 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:43:05 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Message-ID: <akIbARuf3lMAg6rj@hu-mchunara-hyd.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
 <boo7p6mgop7rarfu3rfsrfah6eq7zp6y3sf6mdq3hsejtacwxx@yl543m4lj47d>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <boo7p6mgop7rarfu3rfsrfah6eq7zp6y3sf6mdq3hsejtacwxx@yl543m4lj47d>
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a421b0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BkqjwfLYJ-8FfuLtd5sA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX+b7WEw7MC7xc
 46ucDDAhAk/JClHzSBcx5y4/GlX30JFa8JMzOd64wDP52tuXn832L3ct2AOy0sZuBGhYYa1s0ST
 aezBe5vW+u2YKhWV/FX6YNV4nLZNlUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfXxbtMbxIyBjjt
 uliby/pNYYv447wzekCmuOf0yEjY0nbmuuJQx7klKvIal/c4O6+8BlzrmCaHg1z1t3+sI57Hbu3
 f8d82UyZ2bobdCV+ShSauepDJfpVJvZnzQEX90u/ZzuQPRSsTot4jw/q5U8mEUfI5caHafdKVxU
 IY52eJw2H/1c1Qvq2c04yD5XWIcIwolDZKvebi2vCclqtKISdm9F2wx/5dSFKVX2P4VOdvF3hAu
 gfKiiGy4QZys2wvhHzoQIfp+thl4r5L+KlY6UPmcpuCgXdpgLqo3BySCepVMpdIrIn9CLEt4U+s
 KbkM+QLeypYS648RqCpw9RorhWPs4BSNL1rW3vUhMVJXGr6NDaF1cEAGWj18+tKg064kvc54lEl
 cjYT1Lasr0tmrNtE8KvbqEmhKLULuhquS7iIHxlMGi7qfb2XMhZVA2ZIArfZlWa3ripMcO1eBIU
 eYCNB7CLi3SWRMln6Wg==
X-Proofpoint-GUID: yf050hIZ8kgpWxvWdXp00JEmuD8bdNuj
X-Proofpoint-ORIG-GUID: yf050hIZ8kgpWxvWdXp00JEmuD8bdNuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,hu-mchunara-hyd.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B52E46D7094

On Tue, Jun 16, 2026 at 03:54:56AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 05:50:43PM +0530, Monish Chunara wrote:
> > This series adds SD card support for the Shikra platform.
> > 
> > The first patch adds the SDHC2 controller node and the necessary pinctrl
> > configurations to the base Shikra SoC dtsi. The second patch enables 
> > this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
> > the regulator supplies and the card detection GPIO.
> > 
> > Testing:
> > - Validated on Shikra EVK variants.
> > 
> > This series depends on:
> > - https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
> > - https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
> 
> If the SD card depends on remote proc, tsens or cpufreq, then something
> is wrong. Maybe, the way the serieas are organized and sent.

There is no technical dependency on tsens for SD card. The mentioned dependency
series was to ensure the changes get picked up without conflicts.

In the next patch series, only the actual dependenices will be mentioned in the
cover letter.

Regards,
Monish 


