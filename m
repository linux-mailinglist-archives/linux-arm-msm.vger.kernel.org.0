Return-Path: <linux-arm-msm+bounces-93732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJb3IaF7nGm6IQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:09:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA7179639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1027313FD8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29235309EFA;
	Mon, 23 Feb 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU0HyF/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xmv3Gk2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4C304BDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862508; cv=none; b=uisnX4XtgQkSMX+07OGTYM0AtEZOFKTxlq2zRjdwJxd09VQqHqY3BKMOkBqF0HH7IOB7rNb2yIGQ2nfyRDBPQKzP1DmmhquwWqvO5jdiy+3xPPl1LlU47V/ugvAwwNXCUrzepy7ysr5DXOIlSa5nmMmtkJ1ALbPfm7KxQIGKLd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862508; c=relaxed/simple;
	bh=ak2WGfg2GCfPz1h6kRe2vLGGuPlnnjvMG40wOlzZYkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwsjWJmfmV8efV6Kxv93Oe83GGf3quKP/ox+6MwUn78fnECI5fyPrJNJWxAUOtHztrm7nrTEbbxGBINNdUl6660B8+leE0uQULR2jgiEcEAnrfIwt5aZ25k1FY+V9svPlx8ses9IUqDwZpB6NHdyIoiRfWBg0293oXhipDzGQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU0HyF/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xmv3Gk2A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NDsUmE185737
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=; b=SU0HyF/Iha5/1/uV
	QT0RPU4GePtTQFeUAXyZKosiNPGlzWEpjMQUrncfxIDT4bh7rMJqdupNxb1KvxNS
	TmdzhCE26CUMgeKc/oHZsIsZp8Po33YnLkuV2ewNnzVBTCJ5hePVM+UvzKlNq9ol
	4cXzS8DNebdcrTVthkKfBRmNuyYa/GRsE+g93LcGsYJE1E5+CkbShwC5M5+taHnr
	RKWkzTkNMnzMj7xHTvM+yRFfwibPPKIadzuKLSQrT1zTDDvbjbiuI3hOR8QSXADk
	BTj3qiSuUArbAkZ6Dhjn6niMGn3IGOzq5mJdLT2hw1pahRe0z/PUDIPOMa5dxSyC
	YGji1Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69gdbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 16:01:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so4957132eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771862505; x=1772467305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=;
        b=Xmv3Gk2AIGocljPyU7AAc5JyDoHejgaj1WcaxbC7FYMtCQAuHZ8N+aOzRpdCP2gIc6
         jz7o5rUmjdrqGIw1AK48bWcMXQTQwgHTPj9Sqf8VmDhcWRFzbwcdnSvAqjWTZkpAv8ZE
         x/vt1CfAjz0y0ij77MFCFE+Q9+zYqaKqKwYAe74SrwXsjDM42SrDC5jf+jo7obc24hHv
         fKLbjnoGuN9S3Ts7YYy+0Pc/6XnXRqncOUCYGc7wRn0jugZksVaofGviJ1hed3lQKhDx
         Mo+8yFsvq5gVxa9B3LIXDWa0DO28i9Kt6uGj60Y1hFjKd0n+ezg2lvKIE9pm2bM5VDbk
         g2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771862505; x=1772467305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB57/lyfKRXlbv2ojASFy7z0cDL7Clc/mnkKCE2srms=;
        b=Ow3AdaqM17B74L+Tvr63q7pYPUrpOZuqcs1yOf1Vi6AG9UrTDUi/U94UtdAQkat/+S
         xE0mrioe0L4I0NrZX16yLnYlMr+cK9sgOr1iMOplJK6qtW7uf2iMp+R/4B185RFTk3bY
         zlfoVzbKSPvmK4pz4PpjnXYz1ulLV37VfXlzOLwEA/FM7bitnM6xGbBq404r+QPL7ZWs
         pA1BUr89nv3p4h1HtGzyaKC7Fv6gXoXygUtwDG6r2xBHSyqLltTfTzHU8kR5gwkVooco
         ObLKg+9gX5SCfBrR+rFUgd22oOZCVqmjCYlcj8ATzLW4qD2VTqc/IN+vc3ZSbho/mNsd
         woUw==
X-Gm-Message-State: AOJu0Yxa7Lp6QOalSSmvuhw+Y7ek8mUExVo7EPgLOX1WwEmnanyYf/Tq
	W8j1zvRb7DfB4pMm9BWaLSfZGJ58aWrBQWJDf69ql1iRzOBW2N8CMPtPo3fmQEJV9C71oEup9VW
	nQvzSpUbPlhuXESoFbtFvuJrIBJlylBNyqGUpOI4/2EKOlt/VqojJEgeJnX6gZXgwqXMY
X-Gm-Gg: ATEYQzy4sWYrmq7o/Gp32WztmYdSpOC/rvQl1ecknD4eiHf7SEX+S6ImkOciIIZu2Ah
	K2THxp2rKa0T8l53+sKlHUA5rqlmTJ+xrzhwIIZHNszVyTs6e5VSrMLH+gQxbSbhgAS5QDQ2GRC
	NePKMpD05cDr7pMuzop4GV6cgC90zqy+TYmTEu5FQODF3cy22iicopspywkvyyfTHSPkvz+MGpY
	8reWKAqRlKPHDoFRvQPPR3jCLriALV088QYPanlFE98cfAOlw/4sr2ZitONyMGYMvRnwu8Gn8em
	+Cxr9dRMnw/KpuMsCD12VRtAb9XkBSQk9cpI3/PUWUpbcnuA90VyHCrQg1pWwHviPZVYWsxoDdp
	s0AB83amzJp8KDvznVit9U2tRxgX+RrelXI9e/ytbCu0VnCZSWEmrJ7FE+AwJWeMh4GsN0PTONn
	I=
X-Received: by 2002:a05:7300:8cab:b0:2ba:a075:5422 with SMTP id 5a478bee46e88-2bd7bd33409mr3422965eec.34.1771862504322;
        Mon, 23 Feb 2026 08:01:44 -0800 (PST)
X-Received: by 2002:a05:7300:8cab:b0:2ba:a075:5422 with SMTP id 5a478bee46e88-2bd7bd33409mr3422925eec.34.1771862503206;
        Mon, 23 Feb 2026 08:01:43 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa37e9sm4957889eec.11.2026.02.23.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 08:01:42 -0800 (PST)
Message-ID: <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:01:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
To: Shawn Lin <shawn.lin@rock-chips.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699c79ea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=S6WfLNs1AR-HUFovPioA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 2tAvuX-HbGO16pTClO00_UaITDsk7lYq
X-Proofpoint-GUID: 2tAvuX-HbGO16pTClO00_UaITDsk7lYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzNyBTYWx0ZWRfXyDYdCuqymFyu
 VrAUhCqz1SsnLrgfIoDhkdWhKi2AHYZqe/KXo+wAJN+TRP5im3euV913mMbbsP1EmL43A4H2UgD
 MLa/ojzU302KBk9vSx3ymkDs/wvyAco7uvPhWzYuu1M94v2fc5SdN92NKDFNxRqm+PJNoqllN1b
 VnlsVbNRWmolCf2vxBxIA+hoovjfijGdzVQ+O6wPhme56lu4KAaycHvodjjTgGetwbP8NqiEvgS
 Uf/zmVP0bjRQ2OC2FOWpv5yVrlKo0R80bkLeyhvP8xmcjTBVhroXi3dFrAQw81jvR0dl6zk5Qsb
 h8dl8yI0j7bvSi+Qq0k/oqtCkSTSRQLU+lJPgwvGn/5pltaaqPpzzx6RX6ft6Pus6j4oihzKXIJ
 nH8C5H2zX2Cc3lpAkDvrrus7mU1cW3NXGmWA/1pAk7v9BsRQmjOXY3WkDpiXPEqziikCacJjr5Y
 GD7tT4q/PgWfa4L08KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93732-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00BA7179639
X-Rspamd-Action: no action

On 2/23/2026 8:55 AM, Shawn Lin wrote:
> pcim_enable_device() no longer automatically manages IRQ vectors via devres.
> Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
> pcim_alloc_irq_vectors() should be used.

This seems to break bisect.  Surely you should update drivers before you 
go changing behavior.

-Jeff

