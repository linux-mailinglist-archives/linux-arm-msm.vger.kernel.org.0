Return-Path: <linux-arm-msm+bounces-118699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nD55LdCtVGpXpQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:20:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BE7493B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=afDUukYQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Thh7j4M7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50C4B302925B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2547F1F3B8A;
	Mon, 13 Jul 2026 09:16:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26643D954C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:16:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934188; cv=none; b=m98mlNKXPNMQNNp7JtH/FCjGHefyKziRgqrKg9z/yy3XbdrwuGCqAyl5e1fZED0Y9Fu21/h+DMqBJh7paD7jXmpQxJBTr/lVTL4TGFfcQVSkC3ujghNaoiKyVaC46fYfcxU6NokHqJzEb4p2cozrJJ9LP3DTyKRx+L8m8px3b4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934188; c=relaxed/simple;
	bh=+IKt7HkKvvuZndazkU87cKD2wlXL3ZMBBm/eMI38q4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQK/RzsfIZ3dUljxFjNGvL3s0C6cFHw5y8ma5PiaFNauPlDkViOqlhEnVtHpyHMvFbY1kO4kqcjtpRdNwpU1FdUTdbuoyYI5cTIw2Yi+9Z1ajQiFVujGeNYGue6FILwmb+yuPpEq+YV26m7BFKAXRtjdc7CEirPdAiLmcrwhBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afDUukYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thh7j4M7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NxUU674503
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u7OzcwJPgZs
	QHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=; b=afDUukYQ78MH83XCkauFs+vMTZ/
	xOyNWDf6WL/CM9LJdHEGic30lGUYZvRGJJ3Kyz2T1y0HCT22luB0e23N+z/EUIzf
	5khm/3SMHkGQsQh6bHyhITolyRnyFm7C5wpjQj1WtRuYZyHwr9+wC+alJ611tsG0
	8AtNzdrndDhk8XAcPDSte+5v6N95Rkf6HreGQNdT/W5+VQb5VQU06CIz2Z8+c6WY
	vPVgd01tsrDfzhhr3ZCXUeybPw+3CepMYtgJyNezCPSuObTlbCwOYjCepvjcsx1L
	QJxpnVywme8ybMu9ADH9VwNZet/eFzd4szu7a1EkvXJUMTHpC9cs2HiJPFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgnd3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:16:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-382befb9555so896675a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934184; x=1784538984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7OzcwJPgZsQHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=;
        b=Thh7j4M78vejxkyH8T5Yml/dsm5WAUCL+cFT6Nui8nr1IKKJUjtNvyhbed3rGOj2z0
         ZijxFVne8/2ygOjcXnA/jqwhYKdA1x59oUr9pp1liSHj9xX79YZsqa/hX7ksXbyhKLPB
         zLNZgiegfuZU8YWZBDggsbxX2zQ2+fqZueeOswy0TLU7cyRu1DumbkQ7UQ+N4oObPQmO
         J57oGCugElKA4CD5yx1MnOo3I6nF/VuI7tKOfLFo15FGW0qsIA7/W7OUZn47erVJNcAJ
         1ej6tdYokRG7WdRHZDKhCNG2OZP5xyyR63VT/VojiP3zAjF3tL5nVDvvAnk1b8K+CF5B
         ixEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934184; x=1784538984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7OzcwJPgZsQHVGY+2aqMLjEMoYse2TWQIvIkQHyER0=;
        b=D1mvSAVAM97ez5HC9VBiRr3j+atux2Lzd6S7pakV3PU+upCe5GlYt+ebXZWPLh0vK9
         Wi9aZw0RwQZzKpJ4W76h9J1J6b0ZYdL1wBNsttXTbEz524C0xvB4dVHLOxLwzjJM/nzH
         RUB51M9fSNJduOkJJHEZhBHlWRAlzh/ORPSwm+a1K/UckW7TP1wypdDO4QudX6LD5jJp
         6AjsWF0xywSu8DasafCb3yEHYI8Tvp+1eLfeNCH1ziZOu8ivOiswwCuqlq4z21fjLdUs
         MYuGcNYSmoL+Z+6agq3B+HXiWnpFpkSDDSjrSqoXQJzGCfvvGvuqm0lygdiPwV9HZCcF
         OhPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8j25jnxFk6iGT+oahPBkWaFTWbXw2yCv1XTgHNKOKwxChyySzP8h4pVA3GXAmPyzeF7EppaG7hJmjhdMa@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOyX+/PqnsXZLFip2l3je8lhDNp5ZQsmBIQ2a3CzFoFtfAUUl
	GTqEgWe3hbWB8YztoK67728bPU8/gH31f6eBfK/oR6BWgHS5EElnqXVXNbd9cymlpGTddNLIOhv
	dapixnGZh/3BFfqS2Ll7LJH/vqbjpsN7MEU0WcIwiocOQn/UbgPZg6eShi/ICXhKyH/vp
X-Gm-Gg: AfdE7cmmGB6Im47dF2Tka/rjkLeBs344MiIznflAud/+is+AgoefWjO4lBJCK+TDYGF
	eXKNzrYVzBXBquaG4FvRkQ5sAQy544gm3tvMyUXrwT3+f79NOFnEnLpNAuydIztkxOHt5sXgjVg
	/dioTmtxbO3qvsVtInU70lcPS8rwolpJaLXNgBKyUqa4c2+pqYqyELnlbr0czZBI9iT18lkOyDK
	a5pkfRpWrC6ex/Zl9gLFPZRYQKiXsXjbGy3GlnA5ZJj/Hgnihv4iSf3c2baVGhNxDfoK7v0tVG+
	ejO9DGsKnuLGZ3dM17HGIwj3jZ7AoaWBtjyURK/4gk29b6gbgY5zrpHIwOJP40paIBn5fDJ1Wxw
	ynnWRvjVSKEFU5zJmUjuCz6WZFija1z6o4D5vS2yno+OGpAWOEqMMSTNi2Io/Qg==
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr6154253a91.5.1783934184103;
        Mon, 13 Jul 2026 02:16:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr6154211a91.5.1783934183550;
        Mon, 13 Jul 2026 02:16:23 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm26496089eec.23.2026.07.13.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:16:23 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created
Date: Mon, 13 Jul 2026 14:46:16 +0530
Message-Id: <20260713091616.4092086-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
References: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NiBTYWx0ZWRfX+UgSkAFKdcrR
 tNvxkZQR8tPiAAhqUnFM6DZbbGVTFbpx+Ed9hLibxA2Y4JXJvsT5qPNyjkiOto1KfEXXF0g3klC
 +jgNAQtQ7cW8DlGFsVimb9mByaB93u8=
X-Proofpoint-ORIG-GUID: DS9feZo378Se9erqWtu5OjGCoypemlxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NiBTYWx0ZWRfXz1a7TQhHh6El
 5PJR4Xje5W5r2YQb4iGbokZo5zkIGS6E/1me9Nkejy7hn47dM8SEHcUKXRSYZY2f/Gs9FxJ+Y7R
 QHXazG1EvnobKC9BWymJDwB67tHBsOEG8E3egJHBgdmVcGGofaFl0LwAKXdLQiNe8/ZMaycgJwo
 xYNGGYxsb+zKqHYnVTQPDM1We54SAml+YTZe52pEfeq0ym1x7K/BWo3E2l0/v/i5SaoPpNHRc3l
 iEdRWO7F3iLo8oLvpxGry+C7ZVXygplM6kyzX7Mt+jkwv6U4fZ55aIecc9pooKzLMynuc8qSlU8
 aDnpioMRaC4RiP5N0bh50FCN+H3Muw2qBAGGWTY8jgGcjnNwbCOHxNia8jggZ5GhodIWulC5Een
 VfcXgAPVv7mOerBJYUGXKNGv9+gij5SNR+5yXzWx3AOb9g8qj9Cx6e1V/WIg3RgkKKfXkJHf9Et
 RCRVLO3EKNC2k9K6rHA==
X-Proofpoint-GUID: DS9feZo378Se9erqWtu5OjGCoypemlxW
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54ace9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=M_wy9YA4QbPrr36y3cgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-118699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenst@chromium.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 156BE7493B4

On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> > The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> > BT transport and need a UART serdev created by the driver. When a PCIe
> > device under the M.2 connector does not match any entry in this table,
> > no UART serdev is created.
> > 
> > However, the BT subsystem of such a device may still require W_DISABLE2#
> > to be deasserted to power up. Rather than adding every possible non-UART
> > BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> > whenever a PCIe device is detected under the connector but does not match
> > a UART BT entry. This allows any BT interface on the card (USB or other)
> > to enumerate without requiring explicit knowledge of its device ID.
> > 
> > The primary use case is USB BT variants of combo chips that share the
> > same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> > sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> > W_DISABLE2# must be deasserted so the USB BT device can enumerate.
> 
> Instead of forcibly toggling it, would it be more sensible to tie pwrseq
> into the USB too? The onboard-usb-dev implements the same idea (of
> powering up the USB device), but it predates pwrseq.
> 
> > Reassert W_DISABLE2# symmetrically when the PCIe device is removed.
> > 
> > Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
> > (sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
> > no BT interface appears; with this change GPIO116 is driven high and the
> > USB BT device enumerates and comes up via btusb.
> > 
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
> 

Hi Dmitry,

There is a patch series from Chen-Yu Tsai that appears to implement what
you suggested:

  [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
  https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/

We have been testing this on the Qualcomm Hamoa IoT EVK with both UART BT
and USB BT M.2 cards.  Is this the direction you had in mind?

Thanks,
Wei Deng

-- 
Best Regards,
Wei Deng

