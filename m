Return-Path: <linux-arm-msm+bounces-116332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MbpXJAHER2rhewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F770354A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:15:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m3ZeXph0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MfzaYzDX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116332-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116332-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8174A31B2326
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92663DB625;
	Fri,  3 Jul 2026 13:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB93EDACB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086349; cv=none; b=fU+jpQ2akgYbJaUlizDmm0XXQ/gbUm3gFNfZ0AK2qEMpTraOTIkCQS+1JDlalffCGC4vniAcsqo70t5YB40UbAR7/WJsV85iJLD7HRvStIedqWjudAl+KOPVXsyKQJsRRxFmmM9Go38FDhqb7CIOrZTrNErrZTr1xrIMpVdjyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086349; c=relaxed/simple;
	bh=WoEsQQXEHcp3Z4NugaMqCjtqYrDzpmWHIggHogkIi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyD7QCQfmZcMEC0+V6ozi3+oXO2jscagMDRcb7d7880OGBIOSwbDuTiA3vKQAOKZKydk1kioRc5PanJ/TbN9l+m38eGjd3gvTaQxVEZcZRNgE6cPj+Aj8oeLwzXy+G/I4t9eMKyydgTi18Ct2qoVGMv5KS38W6x/lGZXI8qMk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3ZeXph0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfzaYzDX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663C6Ylk3144211
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=m3ZeXph0qWHngde4
	cyKZge+jjCK5fC4rR9gZXCNMwv//46MvW0g5T3GTreKkoX81ZKjiGv2oAyBuI3J8
	AWDZ7yFrfxrLeyTltJ6MAyeFz1owlPAK3WMFy1/csjR+M6n+ZtfDY620VL38nM2h
	dJzUsWvGIC8BIEz8vc5uDQBGjV449EYxd1mORNaVVPAgD7kyEmii7WOT6T9SJhFF
	Iqhv18Qe4JGzwPqYT5En9tvzwEm++OlruahreWLUcXWodo6IduWS6YXkoMYvuwbf
	uX59OIdL1VpqYEIRfNysL+zWXfKlJDhp6F4c49B1EP5NfVFsPBai7e+vDDgF4gD9
	qOUvdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsj2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e3ae05d649so7105896d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086346; x=1783691146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=MfzaYzDXh/mKrdEJnjOkXdyXxAVCSWQr34fv6GSTJAx3m1PEV+q9LDmM3roX9QEO+r
         Wr21a4BGCMajbUdW2UCj6gSvDlyh+T5vkoAsIOtIZ1sGLmT1PsYIlPt5WYZIZwj/e11D
         DdxSxo2J4PMotXmvXEDSV8O6XESSsHyTnX5oLNOsTHe0bx4UrUTjShLNwyHwPa78a3++
         pXOWRxdXtYawCHYswASLApm7Km39Onblk9K60wKcGRj5Ft1FWKis7UDQfZWbGYaMs7/X
         rSGuv/0pwWvia8dn1Q/MRwQcfAg+Xg79Z3acLyzdd2FlYzmZyXwSgjYAwQoQM0iQK63H
         dhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086346; x=1783691146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=FNOVEEUmqjKMhvOvglfeHcrhnEx+C2YbouGu6mxGY8xNQeyWwybj7llD8f/6dBwLx0
         yozCbgZwip+cAdgq/2pm33DSn+3yO5X06CM+Ds8qUhC9OMKCaLbcqWTKMRrkj7fjG28N
         SNu8DzJ+zCwvqAVo5lP4gQhIvK+OpPFq9m8b4ZeLpWW9YIKfLOH2E9LhbjCDDzPEgyXU
         cK8Anu2AzODlUpZCMWl18JqNaQ4/dpQbIIz4e1I8rXMlEMvOHulYLEZRtZ4/yZ23kWy7
         up9JhmvqfXXMoBPxwJyzLpLRdfLUsjdeUdC+F8M90umkRyFn5okkizwE6X8ZiFk8VYU5
         QaRA==
X-Forwarded-Encrypted: i=1; AFNElJ9NIRYR4PIjdSMeve2IbVqx6TmwYS6DuaOrf3Iz16n/FC0wYbZUd+tcDFDI/pn4DnVudm6mh7Xe4/f6mTSF@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwpc0UuYfnOJXRy7HiTc5OSYk7oKGhJuAOY/J4fIGThiq/8QY
	IbDmrqmGELTXzxn2p9vhqDVL3ifG5pcsgpD5OBEA+smmJfosX/QLVxv0MRbxAEDIoBGVq1wzW7v
	YHISlTcuuBezTEs4azC62zOJwm7lAycf8u6ddjTiG/corOEbGW0+xDJF8Y+Tv9YLjpf22
X-Gm-Gg: AfdE7cnyh/cjqUzGpgDN/MlapG/3zs2HDi/uxhFoeWnGHO6cGHC8e/+pLM6zz+M3Jz1
	SJrsvDDHz+DQDbL4S6Jvj4zjLfnH3TewsAXs9R3cpUTTctYCAFlInQAsi5tnAutQMN6OPByIYoD
	onWVCShnDHqE3bBoIQNkVhtz35k2zB8kNlWO0NNiQm2vTDWoVxbZ7ghlAsRdkRgbQlEhZkjDgh8
	0w+an3sW/1ntJXVlSICmvXzwqQpMFLGshJAzOQPDRNe6vp0VAfJdzjd2DXXiCuCY4HYKVz4RqgQ
	yAg0LkYkvyPTZmVqxgv7/Whwe9FCsZFZC6GHOWDQ/8f2Gp9+PDDiGn/AADyVwzE94D6U+crp9lv
	6QJVXH37vwWYDDRB0OA6CjY/CDXGeK2Q1b54egJjSEGMojyIeElM26A5QJCZxnrlYYRh1RyAxlO
	xcXSGdVHGKjXv1PgchTfSY8nw0JTHsUptJYjHV7Vp8/jprdYIifycguVRW31s9Ou8=
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407960485a.12.1783086345730;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407952085a.12.1783086345170;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:22 +0200
Subject: [PATCH v8 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-9-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX1gRngi1bM5HY
 0PZFrbRD0PGqgGHbm8Y0B53CyKcngisUq5LtK6GMPOLhJqXGHCAnSXKxmIaBjVCQBREYzC5BfPt
 BzJlQMTe3Ctw0cZOLGDkQbmxvhwXJsWrm6B270dwoc20YaJ267chzzq5Nx9aQZPUZxm0pxP+164
 dykS3+KW6xk6JgkQls5jC/fkX0cD2vh1M+KtlBwTyZUgQGbW4MsREcCHvd6r14DsstX+vsEzEml
 B72wmy6g3GpGTkVn+iYVV3kDKdgPvyn6qz+zZ0edpZrXPat9kOOlS+xyoI7CtAOFsIXbMaXKzJY
 Q80klZ4jiaWyJ8pDALr3Q0N4MPUXEKFDuMqHX7o+EWFlZydDW/E0zZdz2mRCLIT6aT48jCyq2bt
 ePhLI2gHP23ofltivRLjXP95/q6BqJ6zIuZ5l4A9U5JhMgj1MrOZKwmQCkBjvq8FwRxSGg+7yya
 6yERoJ6Cj+iBkj7VmtQ==
X-Proofpoint-ORIG-GUID: a6qmPQ2CZ9jjmvKMHhdbnAsnuOEEZ2Qt
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47bd0a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX4ZkEHN/pCDpr
 o/H07s/WD9Gs25aJZsUJfouOTkgKKPax1oUPyjCJHw776j/n6066+UUxi50rVy1/U/sPXVdePJm
 RzASg2e2TrHow5IRyx2edFyiUpt29WE=
X-Proofpoint-GUID: a6qmPQ2CZ9jjmvKMHhdbnAsnuOEEZ2Qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
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
	TAGGED_FROM(0.00)[bounces-116332-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel
 .org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 340F770354A

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..38839b8a361e76f6c1989924b16095b9d8815f66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


