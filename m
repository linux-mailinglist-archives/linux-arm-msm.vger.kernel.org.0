Return-Path: <linux-arm-msm+bounces-100626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGuzA+BVyWkuxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:40:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA423530C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD91C3003BE4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A41B37DEBA;
	Sun, 29 Mar 2026 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xdcini/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etjwcViS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25437FF70
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802394; cv=none; b=BWznfvI6+1XZ8iVEK6CrZY/qoPfGgrRd9Ww3PVFwadR3BRwgluFT7AAVVW/65NXkiMfcU7DhF5ANQgqQbpX9x/4izdfasKFbiQtZVbl4k4j/qWgwuqx+qYNdq+IXkMMJCba5hoxSI7ZhKYqEX0GaaonTvFWLx5MXYrNjtNAzTNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802394; c=relaxed/simple;
	bh=dObbv6mDsOT34Ms3KPDPbr6ZpQuDUkJtd54dwYVsmCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/toCGtw0094J6H3i3ndRGfwsvu8zMb7g3mVT7MrJ6ilXWz1Bw/qLe8N7o+IJQD52AIGzOM7t6Ns90IoM08/eSCf5Ze0jNVKh1Zdn3e1w4Fyy9InpoL7HVKuyVLnplfDPKBvORpeV98s3RuZOVwqmqH5WNQDGp+dZu+pRUdyObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xdcini/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etjwcViS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhfXl2194786
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=; b=Xdcini/3LdKit04k
	3nBR7TkI5QvIjZ2iRqiIEHRTWzfx/8r3387SvYzIX2u4/n4TMcJyi1jnmkdF/KWL
	/+FDnXp7Yl6hi7tIsYGrK9cyVK60zNwDYbbWp0dUIYsHfln9bWC0BQoip3oztQz9
	YI0Gjn3djGuhm9AObgcWnx0UsFZuP6DIyJNdbto4uKlF+3oMDHJV/iXOhwY5j+tF
	loVnXimGb44gZft9gsXfnWUcWZG5pTCG8HpToGm4XTJLVTBT0o71UXfoWwia5MVx
	GL3rE4oUZCBrnqzlDgQKiZgry3EZgbYM4ajWj3+BwBbVw1I1NhLGAD1B9dI4xWMb
	vy1Cyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c142g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:39:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso48043351cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774802391; x=1775407191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=;
        b=etjwcViSTXUXGtyBmDJtYG5r/mkgyS+LsULoHJfG1EF3ZuNd108v95Mffr9rSv8Jf+
         TwMoDUqI0QU9hUGiXRS/R180VaKgihR+EnJNVvA9nsj68CPPzVsZ0VbuxXIovGUd5fPz
         vul2QclidUwltBOGcRTM5KEniD5EthqK4x8SW3IDpZiuOmW0rHEuroYkPCJ5RpLvVAoX
         Cwtf7ZNZAFGgrsl6pWYuC7faJwDwr2G7vURBX2oLzB4L4CNWBkYvnkWGk+DsueI8U0DG
         N/SzZlsDluIhWsvWwg0QzaUTCFBer8z1/ao2R3RZ5m8NyDfoTLSFrcGlficnShoI2mMt
         DrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802391; x=1775407191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=;
        b=U6MSbsjnUQxkt4AIffRJdftNphw/W4yBUK/hU+Wf55IBl4kO4OyJR/so6wskE8/lmF
         nGet9lP6YbbKav+vg6ccEW9ppFSpL/Qr07YJjdN3xQZk2KUXiMKj9p8ZVkCWBMIQkSaY
         FrusvkdMGS6rcxybUJoBuVtbjWuVMuMpgN5KYlNvFk3NXOyrGNj0MoUI8anjoQqhY/tE
         RrNxzoqiLVLm/AScvAwyQktbioKhv939niRymc7bkbA1G1vKTKJWUY9dfa3VAAvJvZoM
         YymQRJkazoOvnLfAiEsWs3RCvj1rxQ/emZwazOzmdb8fRk9hYyGBHpqRlpHPqAd3KEBq
         TFfA==
X-Forwarded-Encrypted: i=1; AJvYcCVKG4cxk0/UjvvCLowzJ15+yk/5LmaL+kiCvpLx6SthWuY/j2/Z2KiPw7rKvAXA17DXm+Ynk6JR/hinRGEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwxmLJ2P8BMmgw8UrSfLT4fwqOHwThwHEROWLdPhbkoLm6YctIO
	0+udckj5C6PbMlpBmgsuQkQPQ0fw2UNxe/oGgO8xDzsSxqxUiffQFKeI3e2P+xpLBYB+K0Bt8aH
	sb0UOBlPvznzWhy8yLTn97yM5whQNC7arKKOkik8MtB7vD7VVNlSSYuq842wQ+oafutG9
X-Gm-Gg: ATEYQzxS+qMvsR13rnxjvSCdPmPIVBPuKWpJZdWvP5uRHsbmrLBuqkPKF52A7BthWNF
	iCnEH6BWb6dWtVgfImKFNq5bqEmdwDfJ68ulTTa4pSrxInEDFxDpWYVFtLL0pXwSEmkfdEhrwQq
	ievl7BaQjpZ02Kfr2/H7UjT+X8736Wecgt0lAYJfP7KGXTQy13F0uNQ88w/1ctjqVPiXJuRGbcE
	p3y6st7IFbtqnqFvv6ab6tV1b7s72s6vX9fKQrm7WKCEhi/wivqenVRocGqLKPuYcsclrMijNcH
	OryKxEK62ZmdIa7t7/vvTr8GMhyQIiTbI0l1UrAyxP4WoO9bJAWBU134+6Pl+zcpDttP7rWbcL9
	ieaFDoTrafhgP0AAiwjxsmefl4L0mgm0YvzYXgfIB8dpqU9UjPM60AH2IbgkgQHvtf1SsNZvwGe
	+NUx/8iIxFVkXEfXe4yPwj9zAARo7ptatXvRg=
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr138562161cf.51.1774802390993;
        Sun, 29 Mar 2026 09:39:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr138561891cf.51.1774802390503;
        Sun, 29 Mar 2026 09:39:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890b55sm10105951fa.27.2026.03.29.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:39:49 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:39:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/1] dt-bindings: connector: Add =?utf-8?Q?role?=
 =?utf-8?B?4oCRc3dpdGNo?= provider phandle
Message-ID: <usxh6vop6bafzqutu5x3xb2mzrd3bthzmustufmojlqxhwu33v@ea7v24iadvd4>
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
 <28c9c2b5-feeb-49ae-9d4c-51ac571ad8a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28c9c2b5-feeb-49ae-9d4c-51ac571ad8a1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOSBTYWx0ZWRfX2IcVpPzAW9cn
 /Kz5NGmey/886DlAOpjAL6GmVpQr3L7ovUiKKsbKFJknF/zmdZysZHNT9+2/1GpbFKx1m0/P8TL
 6OhX9WajQmqDygM3/BTpU6XpUwqKsGskcqBgIHMkqd2dR6m6OGKIprMaK/YcusuNZ4jyt+RM4Y6
 qUi+lCpqoMcuYHQGiDi25mlP5UU4bEiWzbIT54QgeSWHfd4S+jckzJdck96wZej55HzjsO7j+x7
 LpefIW/zIzWXTQ0cb/XAAM+sDI6wXQkotodueHZDXIA6G52i6bcsgWpjZVsla/jr6a4MrGldbt+
 HbkxXPJz8hATOIRwxx4Za8ZtTe3BcVuwRrx+/2x0PRHqsIPuPrN7f3dfaHnsay+vxXLbqQ6fVMM
 AafLL73gKTURbRYs9P88SbyB083HtHggO+2sY+vbkgKVgVfedcVpC6sWV1UMKPAjIaTo6no53BA
 aZhmkuT5R6WeB+pYbVg==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c955d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iFA7ombHHFLmFrjagE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: NG9O67vZTM9mXszryZlLS9DeKvOBDXYm
X-Proofpoint-ORIG-GUID: NG9O67vZTM9mXszryZlLS9DeKvOBDXYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290129
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100626-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DA423530C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:44:35PM -0700, Elson Serrao wrote:
> 
> 
> On 3/24/2026 10:46 AM, Dmitry Baryshkov wrote:
> > Hello,
> > 
> > On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> > <elson.serrao@oss.qualcomm.com> wrote:
> >>
> >> Hi all,
> >>
> >> This patch proposes a generic Devicetree mechanism for a USB connector to
> >> reference the USB role‑switch provider when there is an intermediate,
> >> block between the connector and the controller in the OF graph.
> > 
> > Please, don't describe what the patch or the change does, see
> > Documentation/processes/submitting-patches.rst.
> > 
> >>
> >> Problem
> >> =======
> >> OF‑graph links are strictly point‑to‑point via remote-endpoint, so a
> >> consumer can only discover its immediate neighbor in the graph. When an
> >> intermediate node sits between the USB connector and the controller, the
> >> connector cannot identify the controller (the role‑switch provider) from
> >> the graph alone.
> > 
> > DT is a hardware description. Here you are trying to describe the
> > software behaviour. Please don't mix those.
> > 
> > [skipped diagrams]
> > 
> >>
> >> From the OF‑graph structure alone, Conn‑0 cannot determine that
> >> USBCtrl‑0 (and not USBCtrl‑1) is the correct role‑switch provider.
> >>
> >> Proposal
> >> ========
> >> Add an optional consumer→provider phandle on the connector:
> >>
> >>     usb-role-switch = <&controller>;
> > 
> > An alternative proposal: let EUD register as a role-switch and then
> > retranslate usb-role-switch events. This is how it is handled by the
> > Type-C-related objects (muxes and orientation switches).
> > 
> 
> Hi Dmitry,
> 
> Thank you for the review and suggestions.
> 
> To better understand the intended model: are you proposing that the EUD
> register a separate usb‑role‑switch instance per connector → controller
> relationship, or a single role‑switch instance representing the EUD as a
> whole?
> 
> I understand the analogy with Type‑C muxes and orientation switches, which
> are typically modeled on a per‑connector basis. In contrast, the EUD hardware
> block spans multiple connectors and controllers and can carry traffic from
> multiple independent USB connections concurrently.
> For example:
>   - Connector0 operating in host mode (connected to Controller0)
>   - Connector1 operating in device mode (connected to Controller1)
>   - Both active at the same time
> 
> In such a scenario, a single role‑switch instance representing both
> connectors appears ambiguous, as different roles may be active
> simultaneously on different ports.
> 
> Registering multiple role‑switch instances—one per connector/controller
> pair—would avoid that ambiguity. However, this would imply a single EUD
> device registering multiple role‑switch instances associated with the same
> firmware node. As the USB role‑switch framework currently assumes a 1:1
> relationship between a firmware node and its role‑switch instance, this
> would likely require non‑trivial changes to USB role switch framework on
> how role‑switch instances are represented and managed.

It assumes 1:1 between some fwnode and the role-switch. But nothing
implies that it is the device node. It is the parent of the
corresponding OF graph. If EUD has two graphs, then each graph can have
its own usb-role-switch.

-- 
With best wishes
Dmitry

