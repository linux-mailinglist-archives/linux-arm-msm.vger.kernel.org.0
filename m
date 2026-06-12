Return-Path: <linux-arm-msm+bounces-112942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YRprAL0JLGqCKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:29:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF9679D39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:29:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YXrNqc06;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BtIj8jHf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79580351FEE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECA03EFD32;
	Fri, 12 Jun 2026 13:21:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AC3EFD14
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270482; cv=none; b=noCbLZ+At9jQWBdABWKILrm4PvKoSkWU0Q3QlrYrqDfcsVkhwcYpBVR3y343NFqRU9pUSYKSplzin6x+B8HSgqc858zmkVb3HH/V8K7b3JBkFeZ7/uPIMF4fOesn+Q/NQ2h//OLUm0zMW4xzEtVsGpW+Y45GzgPXtbpXO67I+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270482; c=relaxed/simple;
	bh=6b0Jqnu0CGr/aHLEgYJK9A+WdSx4puE7YgV7L+bka1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrW+FcMz4CzemqB7VtU5HKGhSR+SHtTR3X99uN7AePHN2jrFDBuksr1kZ48rm2px1dC5Z6GgCwrkRov4+a4qBzr5+VihLEDaPsEEcxiAGdfwO3ybmNxlvQCMEj+hvAhpgDAn5dC8HzFtDAxsUAtHplYYJkLGZuGuiXaJsvR3tos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXrNqc06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtIj8jHf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCijQ03747557
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=; b=YXrNqc06L7zlN7m3
	6IQJg5pacCoqFjf7ZZ6zyuvVf6fg9Ya2C196FmoQ46L5fU3vcPNDHRqBmQEmG45m
	9f/gc1ABjs2KdCZ/m08G7x8a/smCcdaTwcfP0oMWGSo05BRue/mNvDyFK4QoY8Jq
	TbakKrHEj7hM/a3ZScH98Ftc8o4S7b9Mqrjmb8FQsyA0u99fPfVFpnm6GpmapFxU
	CNRPwJi36GcnVOosFY5Sc2YcCld3jCDrUuAsYU8/fq+6/CjE82kB05pG8Ho94ABe
	u6TQ4djOFDkRbDw/+5lHtzKRofPfkkhrWrG/zdaRvANv6ZXFqrO7e+W4FUmL95jR
	FHucfg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehy9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:21:19 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69e1eb09b3aso1079181eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270479; x=1781875279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=BtIj8jHf0aeVz6HkPGwWIcx+980zNnLoH2Eh/RO3MhvhHV/x9/dYqmyPez8MFGWqLz
         REnl4SReC91PT1Oj/UXG12EOmDFC+Eh9Tt3/wuOFtz1ejEwalTLOTgkGnEkdFrRN6M2c
         HXNjRgII3phw2VhAfqV/2obtRNV8ndh7Mbky5JyNj1qnYzQU9lFGPH5307OwdTkOqivu
         8JJgXo4tGHkn2nCJfNHyFOou/anVzZ+AdQwzaR4UbvlJXdqPHb427PETYNPQVy8IT58F
         wfWpGpMsmhPjE4Uyia3kQXl+AhbQ/BMDjc7iRycGpm15sQUIQcj5z0cz+BsBClxnHqkh
         FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270479; x=1781875279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0giUD+SohDjvu6JqPIFA2PNVMKYNwxQ9YxaoTjC03s=;
        b=hXIyQTeBWtGppQrJ/8GyTcb9tIkLbdJQFCdPIHSkBWnEfF3dOAXqZYM0dVD/vKUAVg
         0K/g5dIQq/JEAR3C8AkKhs0wvVIj4gq9/V0BRsp7QwadvRnMjOSC4nCze9WXWjHcg8f6
         jr3GP7XdgCGNLbj9H8lKKU7l9ZLG7CIHLL7vfkayOrA7UjHGXniuCHq4ZCNFJFQ8tCbk
         0Qs4J1eYLnSrblJrNvyUysw9CMCI0Pm2PxCq85l1sk2vqQ5mzye6H3EePJUVRg4rf5tu
         mp3TTdkFii2uMRQOLh+o8mxCyL5CcGon/H/Dm8fAsMQbIH9YdPOKofBCamKZJUnUDvLq
         arbg==
X-Forwarded-Encrypted: i=1; AFNElJ9LVswChBegHNZNag7J827xgiLc+YJKhGJrok+BceXXP1sHrl2CR2V1KtvP9PuYPUs4zbeBCrHI22d4rPz1@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKcOqCgcxeHiRJ8TwjA9RIa953Son6VufKYBpwZFuC9wTu77O
	4KGoLIt+98AJhlVV4Fodq8IDK1Df3VPXBncFzYR4fY9rBZkBfDqY+W1fjIDsi/U9I0BnFc5Jh1g
	iIzhZW+arz35Y/qIlGSyFWL1Y0yJqsBsoOWpLSqAOebdt7hYzWciGJaL55i3ligAIBCCQ
X-Gm-Gg: Acq92OHFJCfQs0LIn6/8ai7HOthV5qMhEXqmI3AZGj+V7VHvLHhn/5nOBLWAMpabsnQ
	/7Bpdw7XWyUL0lU606D7RWHIC7AtkmHGVrxdld6G6nTBAJbHiqrHgrvi6AwnAY0/udugBWP/DIV
	oYHKCPAKaVhlKFhlNx9hnawXJQr3sGnMGACZoBe/7njHh5xiVvIouXD2yCvCrQvgSjcUsCLwAvv
	jHAAhXKanXfhgy5Nu4R+t9+cCqGX02a0I872nAWxbJX//X4yYLoqbZ1v5YrdOn6VQv4ipnlDrQ0
	ty+CLIpMFEbY/ZGXeDGTlj7e4YTSjA6fL9b4Wmar0Kzsg7YeQPF7+V0ZtWNq5MuqIM+d1waBnYJ
	A8TtOviqPXNNay5ugMoEOSYNasa+8g+21bZxeZFVT5du5pDH1Vs+JXd+tANsiOfwCMyevJb+YPV
	FpTiwS4gpix4avyxmAsymHByhDJkyzsKCuohwrpr7YiXv0MMXNYvUZWz+U521pREM9StOaq1CU
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695443eaf.30.1781270478938;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1786:b0:69d:fb2c:77ff with SMTP id 006d021491bc7-69edc6f1377mr1695409eaf.30.1781270478503;
        Fri, 12 Jun 2026 06:21:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:58 +0200
Subject: [PATCH v5 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-6-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c07cf cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: MGPkCJwX_qeGdhA1PPL8bNwaQvwv1nvK
X-Proofpoint-GUID: MGPkCJwX_qeGdhA1PPL8bNwaQvwv1nvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX6NG7k2vSlDor
 ASxSiJ1zd/ysdbZY/5gIsdw+qYvFHCt10VHsGs8aZCz+U1SZsuPCsGZ2pcLsLcwEjBWHWhQnpBK
 wIEnMfEe5B5w2dYjpH9yWAsG0fmbxbJlGVixphAm3iz3Bak6/ha/6JjJzhpMlloVytYSZBuydD8
 ibeQzddxyMz4i7Rrfbuwnx2aFtYBQqULpTiJjLl8lH//mBk87ABWb+5EQ4gvE4ZGjlxgoVr0N08
 yr9zV5Hbur+yBJe/1T1c0ijiCY0N1cwSkEFjGDgAPe1zQO2rPq6O8eA3cxebxINUl1AFnbsy0oW
 FJEciygKwNQ4XNey1gLla8xqwYndtmPMBImaJH+0yB9U/vottjOFsVoBQzVvvzpmxMcKS745My4
 mM0EdjJUx4n5GDF2exX9Lwx9ee7uS75DNCqff+shrI2AdrDzH1mtuCEs5xhn+vUP1c2y5Cxq05N
 zeWmn0sI9aodF5txvng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX4uLdozqx+PM/
 yJUqoUSUJTfERziDWKpZT9epPXmAgnaxweSNd2uOYwwcLNN1pwL+9VcUFQ5RPr/XWy5YQc/GNAn
 cgZo9zpSpfziBkiGmhZMS/TYzCWyWO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57DF9679D39

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 49 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index d88715a0b3a52f87af23d47791bea3baf5be5200..7854ba555d9a55f3d020a37fe00a27ae52e0e5dc 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -15,6 +15,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np, phy_interface_t *interface);
 extern int of_get_mac_address(struct device_node *np, u8 *mac);
 extern int of_get_mac_address_nvmem(struct device_node *np, u8 *mac);
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr);
 int of_get_ethdev_address(struct device_node *np, struct net_device *dev);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
 #else
@@ -34,6 +35,12 @@ static inline int of_get_mac_address_nvmem(struct device_node *np, u8 *mac)
 	return -ENODEV;
 }
 
+static inline int of_get_nvmem_eui48(struct device_node *np,
+				      const char *cell_name, u8 *addr)
+{
+	return -ENODEV;
+}
+
 static inline int of_get_ethdev_address(struct device_node *np, struct net_device *dev)
 {
 	return -ENODEV;
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..11c1acca151266ac9287457b4050a54b08e2b5f5 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN] __aligned(sizeof(u16));
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +73,54 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", mac);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	ether_addr_copy(addr, mac);
+	return 0;
+}
+EXPORT_SYMBOL(of_get_mac_address_nvmem);
+
+/**
+ * of_get_nvmem_eui48 - Read a 6-byte EUI-48 address from a named NVMEM cell.
+ * @np:		Device node to look up the NVMEM cell from.
+ * @cell_name:	Name of the NVMEM cell (e.g. "mac-address", "local-bd-address").
+ * @addr:	Output buffer for the 6-byte address.
+ *
+ * Reads the named NVMEM cell and validates that it contains a non-zero 6-byte
+ * address. Returns 0 on success, negative errno on failure.
+ */
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr)
+{
+	struct nvmem_cell *cell;
+	const void *eui48;
+	size_t len;
+
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
-	mac = nvmem_cell_read(cell, &len);
+	eui48 = nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(mac))
-		return PTR_ERR(mac);
+	if (IS_ERR(eui48))
+		return PTR_ERR(eui48);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
-		kfree(mac);
+	if (len != ETH_ALEN || !memchr_inv(eui48, 0, ETH_ALEN)) {
+		kfree(eui48);
 		return -EINVAL;
 	}
 
-	memcpy(addr, mac, ETH_ALEN);
-	kfree(mac);
+	memcpy(addr, eui48, ETH_ALEN);
+	kfree(eui48);
 
 	return 0;
 }
-EXPORT_SYMBOL(of_get_mac_address_nvmem);
+EXPORT_SYMBOL_GPL(of_get_nvmem_eui48);
 
 /**
  * of_get_mac_address()

-- 
2.34.1


