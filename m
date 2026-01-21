Return-Path: <linux-arm-msm+bounces-89963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJQ2IS6PcGkaYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:32:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E89539CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D6B47E24CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A7478845;
	Wed, 21 Jan 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuEl6Dwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bx+OuXMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF464657F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983910; cv=pass; b=qJlkKKWwMZEaaoxSairDkOYJLDoa0fzaP0aM2OTx/DO+HWPCHrdm8I08JWsTXKP9bB7Nf+XwyIbnbhaifetcFqwzXGnguqY6AXFByqoDzWUjw9zjQJueFGLyVPb4HkyImjl1Ikn86WoFu+rmLLCImw1l9d7rGyD6aQq1uE7Gs1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983910; c=relaxed/simple;
	bh=2kN+Fo/xCASXeXOYO+GORmWpWIebjF+hSbGqWLVVco4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6jCjyCgV00aFGrBKvqVWgaHQjykKk5wr0tkaUFqbmNDE3lMfdMBUBC3ECNC8cbyFBRICZiv6Bz9eVerO5zrjBFWSphpno7KuOue/J86wJzVziqZM4qXZD6cdjGxVGalhn42NdbqLzhR0n4E2KH7ECxyKS+6qBC7NexmJW8uYG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuEl6Dwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bx+OuXMw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L21rvq3256432
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GToWD4T54knt3b2uU5b/mINEY2hrA9kQR2c/GP7hTc8=; b=VuEl6Dwx353pTapr
	n4QS/eFFKfTd2auKB1O+8gA6NB8scZA2LDZbqciWuQJi3QPRILOkZiKxSQncTywH
	O2A7gaB0wHpJtdUxukrs725xV6O7HyTLAmHkL7oJbvrU9cmowcN5qTFCvXoBucvF
	lux7XFOunZYmIaaX314MwW+YVTh6IvUZDX0ncbo8D7rEeHIMJE/JG6ENmTpu3dbz
	vF3mYs+bq4asvYy2lUlBSXM0r+5IFG7xOwhtQr7g7sNPFTrl4yG3L1xGV5Cpv9md
	yK+dtGiektmffVwkC7iZH8gy3USFLGqBSv/5u7HVxS4Kh4/fSHmHKjNl0g1ZgGsZ
	VL9d4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7vb3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:25:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso68880855ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768983906; cv=none;
        d=google.com; s=arc-20240605;
        b=YiSbu8bMESNj7WcoIcLmkAoDeM/cMRZ3nppDxiyVQ2nxv6l8Z263RsMiZnXVy3VDwl
         JFMutzWJ5xl8tW9A1+SR8cd/FqjlGHd3G6wIz9zzqPUgRSpbo5PFlATx5mepSDCoM3oh
         XRO+fIH/WBUJZQ/5VpJYvINEKA21Gx8B5qwY+oa7k/7Y2mJFWQK1kcwTuT8rN6qZEApv
         BRokctCHCf2i3MSkx2RBmRSdPa5pI0qx5QWzeunWgvwrFXrnPyd37c7v4nCbwSSEMxQ2
         yNjjBnO645CiLJxOUwzSVTIWlNOnkS9xGdgZqYoVs02mEvxEXGZhtqhRvym+ENHLwFq2
         hRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GToWD4T54knt3b2uU5b/mINEY2hrA9kQR2c/GP7hTc8=;
        fh=YhOoGqfoIjYjydTFKrYpRbWGTHu8nFZdT+iuUsiOZRk=;
        b=WUvxONuGJwzwe9kDcgD3zhRJo8t5+cFm721hhAkud4h6DkknmM6Qebg5y8e2bgTbve
         n4ToNshtDkO6M8EO+NeiMee2b29DFiadLrJxDj4kyVzbYHhUPHxENuWWToeXJTZT7Mk7
         9HfQzHIMBDofGtUcSy9ueU0sOZbUFkr9A0NsoWHBpqqh0v1hyGTplIspuJcLNh4/95A5
         IzXYqXTxIbamAKbSP/ZegpJFsP/Nv/GnS5K3mXOt0SvCxWF+7AmtNyIekSdptjM5zqlx
         cTjsd1QeBU0aih8igxid6Zb2QDB1QNDIyyYc3P6H4IRQvcx29mA/cr693XsTlQENefus
         3ucw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768983906; x=1769588706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GToWD4T54knt3b2uU5b/mINEY2hrA9kQR2c/GP7hTc8=;
        b=bx+OuXMwzEif4Ustdk9uiz8U3gOmgJWmAdttbEEKb4RFrB7/XFsai9396EEIrRI2pr
         vzYTDJv56hpfnFTuyYnCpbrL2Jxqgs+XajJmP7MTiUAND+mfsdjwNu161UAy+cnqk3/x
         QEd40hmIRvP5i9G040AEQkgnDfoGoA7rw86u0sce3z9RMVv4XTZZMMqww4O71HMwGt/d
         KHuij2gyJVXCB6a3VOY93L7I0rEf6YjJHi17cwIU2OXfGh2S4SbgHFidfC/tIIYSAN9h
         CdFu/tq8q+v/JP5cx4A3980C4sABHOC6uVhpYQ4jHNqjuaWUIoGHqGlwbbQuLTQ9kgpw
         HEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768983906; x=1769588706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GToWD4T54knt3b2uU5b/mINEY2hrA9kQR2c/GP7hTc8=;
        b=orzV2xYSTkyOkkoQQbQN7g+sgDEMuBI92vDpmta8OLhDm25oR6sqDu8gZKGjXbE3S6
         trMtZClO46lMlWvBNgwLs6BiqQMrhdjAG/bzYVTusshHkptp3UH3wkM0o2JljuNgTp7B
         6OjLNROl0hKcZ/huC1Cse+HMPxSKU5ktyr9qn3YxiMbQFW2i+AM9L9zsj0Gk4I1ljhZ/
         M0vbxkM6DwrxqPuHOKbjER2WfFXjsnjLlANEqzkdB6n6E9wcRdT7PxHb5hZXbZONd4iq
         GFJtvjQoIeIYM3OkKjyERwO4DUFKxkB9S7BGdd/X6TfP5a1O8o7SV0zQErRs+dhJvPrm
         tPng==
X-Forwarded-Encrypted: i=1; AJvYcCVEK4hTMJWujWk3ho+NGQ1dySBHwKQgKKI2FXyKIQ4kz4cyd0q2SkR2F6GJuuGvtOzPuV+0YW55kuuQJ242@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+a3wHb/rq9Xi9RnyDRNKbpslyEcLGpySKI0wzk2bt0yg889ZD
	46XBZMh0MBrrwNKV4mQaJ7AUT7AtknKw5mGbpJj8xOyFD7U2ck7eD0B4AQrK8a9RNiU2mXLHok3
	xm3IjZA8dtnqyE7vD8pPtIi46w63YVZfSbwu0LbdeB5ATVA82FVWbrM7v++Q/tq1EdX54/+T4RP
	H59QbF4xOS3ZCRJVOlZxQD0jntMlBktGjcRkknp71TpkU=
X-Gm-Gg: AZuq6aJxgLe2RmvFqbSDuCd0Ad+Se0stRqhGZR67Sp7UzZDbxAHYteWTidFumeDEGD9
	o2PSUlpvc+uOJRYt3L249KplcBZXXVCd7fTyzEzGXo/PkuXebKSYIRwt6IUSZXr8FhvYASLIGwK
	G227H3/B9Q/tkqLn31MbEWZ6QHnPdyA0qRlTODs0W6s4Otp+nDZxNVfH0cqhBSkzkvefkl+zdav
	gLa4/67NpjDjdEjoS8XP43TeyE=
X-Received: by 2002:a17:903:ac7:b0:2a0:da38:96d8 with SMTP id d9443c01a7336-2a7188a2b7bmr151194955ad.25.1768983905747;
        Wed, 21 Jan 2026 00:25:05 -0800 (PST)
X-Received: by 2002:a17:903:ac7:b0:2a0:da38:96d8 with SMTP id
 d9443c01a7336-2a7188a2b7bmr151194775ad.25.1768983905209; Wed, 21 Jan 2026
 00:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120070650.3192679-1-wei.zhang@oss.qualcomm.com>
 <i77z7i45g72k4hqzd33z643xiuol7olbk65dzv62fgdhcllsmc@kcixnktiyknq> <135000f3-b444-44e3-bbce-e5e274e6180a@oss.qualcomm.com>
In-Reply-To: <135000f3-b444-44e3-bbce-e5e274e6180a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 10:24:54 +0200
X-Gm-Features: AZwV_Qg8HbtdhYG-rmP6JqL0rwHJc6f0wsaRxPDa2v1L6AgDH2p5c13YCwqYgE8
Message-ID: <CAO9ioeUun44YHh9SDfZikXbUJaETHgpZkv+tDpVM9+gE8XPALg@mail.gmail.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
To: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=69708d62 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=R4slFI7RHdfiIwh5emwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA2OSBTYWx0ZWRfX7gkj0PBKv2G5
 bM8fdz9okC42QA4tx3RZrCk8bicCO7BIYYQL4WvBYyPMKCgEAgO7O1qeg1le7Qs5Ky+8t93KjlJ
 RgpqNv+1y5zDGFNGm7x3abtrIqNFVCazgXC+NSyDS0O4b+98B3IJJFfO60cEVNU4z6aP/KDpT2r
 XzOCuYucc1j9MxpiSOhs36tsp7MVt767tikEO13hnVQSMojSJzR2rew5lW8CZoL299iVv7oux/j
 YgYvrlxxGUMgpBhjGeLM0m7ENfymkN4wo0AeZOMfaMw3QKSkAB9RFxaAMq8Dw6BPjClEf+ybL4z
 egL7n79EB66KIfqBEEp5SRzEVvhV8/jcB9bI7i6SlD4SrVkL/8Ko++j4O/Nwmg7FFziA4aTUkVb
 6OjLLy2/wFGW/kRS7kd5CmymbEqG22AlM7ox6SnQCkXm6lJ90J3p3P2nrUyLMClcfvZT4lDjVAz
 Ky2KFtirSpZ2n/H04Tg==
X-Proofpoint-ORIG-GUID: kMf880BsPCpHLLAPU0TF8pqNK60UHKJo
X-Proofpoint-GUID: kMf880BsPCpHLLAPU0TF8pqNK60UHKJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210069
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89963-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E6E89539CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 08:59, Wei Zhang (Stone)
<wei.zhang@oss.qualcomm.com> wrote:
>
>
> On 1/20/2026 3:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 11:06:49PM -0800, Wei Zhang wrote:
> >> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> >> of the WCN6855 and assigning its LDO power outputs to the existing
> >> WiFi module.
> >>
> >> On the qcs8300-ride platform, the corresponding firmware and BDF
> >> are QCA6698AQ instead of WCN6855, which have been added in the
> >> 20250211 release.
> >>
> >> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> >> ---
> >> This patch depends on:
> >> - PCIe
> >> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.q=
ualcomm.com/
> >>
> >> Changes in v8:
> >> - Reordered regulator nodes to maintain alphabetical consistency (Dmit=
ry)
> >> - Place wifi@0 node under existing pcieport0 label
> >> - Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei=
.zhang@oss.qualcomm.com/
> >>
> >> Changes in v7:
> >> - Align regulator node names to match the existing naming style in the=
 dts (Dmitry)
> >> - Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei=
.zhang@oss.qualcomm.com/
> >>
> >> Changes in v6:
> >> - Rebase patches
> >> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
> >> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei=
.zhang@oss.qualcomm.com/
> >>
> >> Changes in v5:
> >> - Rebase patches
> >> - Flip the order of property-n and property-names (Konrad)
> >> - Flip the order of bias and output property (Konrad)
> >> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-qui=
c_stonez@quicinc.com/
> >>
> >> Changes in v4:
> >> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
> >> - Adjust the property order in node pcie0_port0 (Konrad)
> >> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmi=
try)
> >> - Specify the calibration data using the correct variant (Dmitry)
> >> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-qui=
c_stonez@quicinc.com/
> >>
> >> Changes in v3:
> >> - Complete the nodes property definitions according to DTS binding req=
uirements (Bjorn)
> >> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-qui=
c_stonez@quicinc.com/
> >>
> >> Changes in v2:
> >> - Rename the nodes name according to DTS coding style (Konrad & Krzysz=
tof)
> >> - Provide regulator-min/max-microvolt to the regulators (Konrad)
> >> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-qui=
c_stonez@quicinc.com/
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 105 ++++++++++++++++++++=
++
> >>   1 file changed, 105 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/bo=
ot/dts/qcom/qcs8300-ride.dts
> >> index 68691f7b5f94..864b32503d29 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> @@ -24,6 +24,26 @@ chosen {
> >>              stdout-path =3D "serial0:115200n8";
> >>      };
> >>
> >> +    vreg_conn_1p8: regulator-conn-1p8 {
> >> +            compatible =3D "regulator-fixed";
> >> +            regulator-name =3D "vreg_conn_1p8";
> >> +            regulator-min-microvolt =3D <1800000>;
> >> +            regulator-max-microvolt =3D <1800000>;
> >> +            startup-delay-us =3D <4000>;
> >> +            enable-active-high;
> >> +            gpio =3D <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> >> +    };
> >> +
> >> +    vreg_conn_pa: regulator-conn-pa {
> >> +            compatible =3D "regulator-fixed";
> >> +            regulator-name =3D "vreg_conn_pa";
> >> +            regulator-min-microvolt =3D <1800000>;
> >> +            regulator-max-microvolt =3D <1800000>;
> >> +            startup-delay-us =3D <4000>;
> >> +            enable-active-high;
> >> +            gpio =3D <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> >> +    };
> >> +
> >>      regulator-usb2-vbus {
> >>              compatible =3D "regulator-fixed";
> >>              regulator-name =3D "USB2_VBUS";
> >> @@ -33,6 +53,68 @@ regulator-usb2-vbus {
> >>              enable-active-high;
> >>              regulator-always-on;
> >>      };
> >> +
> >> +    wcn6855-pmu {
> >> +            compatible =3D "qcom,wcn6855-pmu";
> >> +
> >> +            pinctrl-0 =3D <&wlan_en_state>;
> >> +            pinctrl-names =3D "default";
> >> +
> >> +            vddio-supply =3D <&vreg_conn_pa>;
> >> +            vddaon-supply =3D <&vreg_conn_1p8>;
> >> +            vddpmu-supply =3D <&vreg_conn_pa>;
> >> +            vddpmumx-supply =3D <&vreg_conn_1p8>;
> >> +            vddpmucx-supply =3D <&vreg_conn_pa>;
> >> +            vddrfa0p95-supply =3D <&vreg_conn_1p8>;
> > How comes that 0.95V pin is powred on by 1.8V? How comes that 1.3V
> > pin is powered on by 1.8V?
> On this platform, all power domains of the WLAN module are enabled
> through external buck converters controlled by PMIC GPIO4.
> PMIC=E2=80=91C GPIO_4 is used for DBU3 ENABLE (PWR_CTRL2_VDD_1P8), and it=
 is
> also used to enable the core voltages required by the WLAN card (1.95=E2=
=80=AFV,
> 1.35=E2=80=AFV, 1.05=E2=80=AFV. etc).
> Do we also need to define a regulator for vddrfa1p3-supply,
> vddrfa1p9-supply, vddrfa0p95-supply, etc?

Could you please describe the hardware. Accurately. Not by using
clumsy shortcuts or incorrect simplifications.

> >
> >> +            vddrfa1p3-supply =3D <&vreg_conn_pa>;
> >> +            vddrfa1p9-supply =3D <&vreg_conn_1p8>;
> >> +            vddpcie1p3-supply =3D <&vreg_conn_pa>;
> >> +            vddpcie1p9-supply =3D <&vreg_conn_1p8>;
> >> +
> >> +            wlan-enable-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> >> +



--=20
With best wishes
Dmitry

