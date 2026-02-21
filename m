Return-Path: <linux-arm-msm+bounces-93552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHxuIaNCmmmYaAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 00:41:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CB16E435
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 00:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1998D302B39D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 23:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025A532938A;
	Sat, 21 Feb 2026 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOIHBZjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTjeq9q5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3083308F33
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771717274; cv=none; b=YT56ue1TkxqB8G+a7GJee/p6ZgrmPJtaI1QVRHeGVhtAmRkque2Cmlwu7G6c26ZHGUSm1vX+Mr6iiP8emx4I6Mu/RAHeoU/2l6/AxStmXw/STcIAkwtTweIc0pweUBios1pD3n344HngnH1oguhTFDbYuPLrAZvHnGiKcblVRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771717274; c=relaxed/simple;
	bh=Pyh+CDw68qCt6TDdXdAGsX5fMpUQS3Cpu5PIrunWYuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3yC1lY/Cj9E4mGsG53kYd14QUatqH2vK8e5/brLwz3zDrzx+bYMJfnca3s7SZNI4ZJNzKuSvEyRHgBOF++i+JEMsslSIjz4RSy/6oJZPkAeFzpvl/X4ZK7B4D0Kvz+msntq1r5IbPEWPRMOFP0zii58CGV5UHU1WYhwlhsBCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOIHBZjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTjeq9q5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LNFKhQ826970
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFEIv7mn9Y6fxVGOCnRxIDIi1iQJr/w/bVMyAKMhSxA=; b=hOIHBZjjayO7LfyI
	hu5WTpeEPkxwbwyIOTF1i33k8OLw0AQy4dFh4StHh5hVL9p/bwNP7UfoCutv1QTs
	f6479a+hz72KbZMUtKQ8hfDqMnNCE6gg3mqejvYPd2pFpxO6fSYT7agAphPa5r95
	NW0DVPP1qEuHEM4mvEcMpZzvAc0Hko8WsW5rAt595q/8zuj3eDEsVSHwJW/egU84
	p0pzVL/lm8X+1pTD7seVyoEHOejVmQJAg0iE/nbkrWLyc9fvHSreoyXjLOyj6sT/
	mqfwQ23EX2n1nagLJg3oOYT3knEn/8zAy2aelam9e0dp9Z5kwUunm8Fh8BdAI6ws
	dSCs+A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8hg15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:41:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824a2ca6eefso1720405b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771717271; x=1772322071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFEIv7mn9Y6fxVGOCnRxIDIi1iQJr/w/bVMyAKMhSxA=;
        b=iTjeq9q5i76pLeyWQV7dUbw/qPH6BYhDSrqaLYE/DcZXlmwA5Tn7fLYJxsRa+Tv4mI
         tJLv3vg9AZ7LqtYDh0ySOmpXal/Dr2lOyn4UMTouoktJU8FDwQ6w0HgbX6HCymDhlGSe
         9LgkhdsE0hihhjLFdfGzUDLBHpDrdkZbWYYq8LmZgUKKjiVCuWkmqTPYuMAEkat0xfkg
         fbfUeUxZmzqbVAKXkQV8RBFBEpO/MJhccA9VNyQFD7D8DFye3JJCKD6jZDs6QI4CFz9n
         tKGLsVFSiSh9P3+L/jXMCKpO3M/IdMdBw/wKxN+FCnZcU3Z3eZb5DxDOLHI0ZwCfV1hD
         uJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771717271; x=1772322071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFEIv7mn9Y6fxVGOCnRxIDIi1iQJr/w/bVMyAKMhSxA=;
        b=CiaKR+vje9V2VwgRnSPtrWs8jwonAGalpCUyJ644JQJh8v7NThD5CCA9MidflQoxtU
         fsxNEHtKlBGQa9tii8D9b/n91ar2jk0X98Fy4pNNVFogOkNH8JokeI/5F36UnoEHsTNe
         f7zQAVSk1Y4t3t4ZU5LYcdkb2xMw8IFkEjPDcS2Z9IZuzkFxyx+BWxikC2de6C6pZ2WN
         5bJY5uB7u9Zii11oLUdqfh5ttCRTF7803ux2t8xxuBi0NiW6iiYH8y6ghtEPi4nSR4K0
         vfleggvrMqBoPhuAbm7W5xVrRak6XQQDbtTPAIPBmxckrIL69yJJfQsnvpxACzSYO1bJ
         XbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV8dcDxpZLB+DwHnsad0qNrYLvUiA7805YzK4CitWDVxcB1RCk5QRAdfrQrpaz/nez5t6JxiN8z0RB2gJN@vger.kernel.org
X-Gm-Message-State: AOJu0YxC2v3S5SeHSBq8nDDkMi0DQ+deTePwirEYlI8S7tGoGslDeO+2
	mBDpKYdcJZyR0uHxJxKY5v9jBKDyJ8GF7/2+SNgYiVfiw23i2lzqoSvpCIi6ECzjVjQAUCdIdvw
	+KvVnjIunSgerVISn/znkMnH90VqY96PjdWAxfVlTE8pP2+xFaOpbXeTqyORv27Tujtc4
X-Gm-Gg: AZuq6aJgVXsD0G3h0OaJk6M0F7ETeQeAkBe+RM/tNaDMXnW9XjIWvyGCKXGeP2aj1EP
	n7wtUgI4ySs2jnLfrcxmXw5aQxtGDJ3X+WcFbCCzjpNEN8uJODTU/4mIoQMr4qCc1hi9VMe8T1O
	4Ejpjh+LzvuAPwtANsvk4OB/iaHddAvWqrpAvSjukbpUsr8anB9zQ7XiC1xjL6IOSul576LcIym
	scjQyFl9hoBZW15WzqbYlI9DO8Yzb78z/izE8lBLm/b/QMsOCMVFcGP7LhreJiLlMkQkvxvgt1m
	t+mcdzO0lAc82RYGgZqB4NYswLz7kA+Uo4gXD2hc4AUhXLlkhL5Dx0MhfZCGYLuLUWhuLApMrd/
	s2TcimVjT3iUDtXb0Qg/H4YuFgipt9JWF3yLncc9WxCwsUD0+d5Y3TxwrB+uC3rgxLblepOZSQo
	AZMlXhTM/PnRG79VHCTWOmD9cRu1niHYcS9Rz4636bMA==
X-Received: by 2002:a05:6a00:26c7:b0:824:cc6d:a923 with SMTP id d2e1a72fcca58-826daaf0765mr1766142b3a.5.1771717271537;
        Sat, 21 Feb 2026 15:41:11 -0800 (PST)
X-Received: by 2002:a05:6a00:26c7:b0:824:cc6d:a923 with SMTP id d2e1a72fcca58-826daaf0765mr1766131b3a.5.1771717271103;
        Sat, 21 Feb 2026 15:41:11 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c5b6sm2989597b3a.32.2026.02.21.15.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:41:10 -0800 (PST)
Date: Sun, 22 Feb 2026 05:11:05 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Enable lt8713sx bridge with displayport for
 monaco-evk
Message-ID: <aZpCkQnWb3zOZji9@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <ke3xn2344ray53viwiyxfap3z22tguyo347ixic3vg5xxe4nje@juujoqxqptq5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ke3xn2344ray53viwiyxfap3z22tguyo347ixic3vg5xxe4nje@juujoqxqptq5>
X-Proofpoint-GUID: FmZu1Gq26Q-ZCYr8egTDXP-7oDjrTHjh
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699a4298 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNfohRsh_S1gWZ89RWQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FmZu1Gq26Q-ZCYr8egTDXP-7oDjrTHjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDIzMyBTYWx0ZWRfX4bSKnX/D8goN
 KSsexjvxD6pa40KC8Aas6TFHDPCN7e41OcTryCEQWgOYOEB5hStnm8Y6ruXnRyfe6dGb3yoBIFM
 nkV4axa9Wy7u91XV1UZtY74nnLNyheJ1J3yLQzTKb9Q08MQXjqEJrAj7eJjm56mrYqE+7Gb8eRu
 c1pFcRA2gD/I+0MClkZsmQUDef9vhkZP9Q92GBU7ijqqivnLUqt44CMLVgW3rl7pJeBIjiNUH/2
 UWWmZHzN/WTCQ5K0NqXOrbWenaStVvvQMnziQm5bE3OIoVIZ+ei1Gk4+E7xy/hI+TxboDccfjkf
 8TtPPCztzzOWMWDROOO5efmEcjbeegeKY480l1tLP1mevuKVvC3pCrgKSmIYcbVamnAzimK2AIm
 Z9CsXp6JfBxeZHM80LeEtFfKEMqpsYmOw7Vionxk8EyMyJa9uPy1DmGhhdJqgNTMzf92vTKDyYK
 lEIp/2wRRXV9s+6Tyag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_06,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602210233
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93552-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-vishsain-blr.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B5CB16E435
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 08:12:28AM -0600, Bjorn Andersson wrote:
> On Sun, Dec 28, 2025 at 07:10:37PM +0530, Vishnu Saini wrote:
> > This series enables lt8713sx bridge and displayport on Qualcomm
> > monaco-evk platform.
> > 
> 
> Please answer Dmitry's questions and please send out a new version once
> dependencies are in linux-next, so that I can merge it. Will drop this
> version from my queue.
Sorry for the late reply.
I have answered Dmitry’s questions in a separate response to the relevant review comments.
I will send the next revision if further changes are needed, and will submit a new series once the patch is finalized and all dependencies have landed in linux‑next.
Thanks for the review and patience.

> Regards,
> Bjorn
> 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Used  existing qup_i2c0_data_clk as default i2c0 pinctrl and provided it's drive-strength, bias-pull-up.
> > - Link to v2: https://lore.kernel.org/r/20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Configure DP PHY supplies and DP pinctrl
> > - Configure in/out ports and connectors for lt8713sx bridge
> > - Use correct base commit and fixed build issues 
> > - Link to v1: https://lore.kernel.org/r/20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com
> > 
> > ---
> > Vishnu Saini (2):
> >       arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
> >       arm64: defconfig: Enable Lontium LT8713sx driver
> > 
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> >  arch/arm64/configs/defconfig            |  1 +
> >  3 files changed, 96 insertions(+)
> > ---
> > base-commit: c2469dc74020684c2aed314701d999cc37c95717
> > change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
> > 
> > Best regards,
> > -- 
> > Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > 

