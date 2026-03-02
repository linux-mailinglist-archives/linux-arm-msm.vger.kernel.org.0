Return-Path: <linux-arm-msm+bounces-94786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO4/AfI/pWm36gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:44:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C141D4182
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 231A0300A13D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 07:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3040E383C9D;
	Mon,  2 Mar 2026 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j049FK3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnnlLIz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715238550F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437477; cv=none; b=Ax8sGqBBOB+tuXOcsHKS/KVmV/XMb3aazCtMfAQoLRq8nkV4zgaP9BpiQD2d3SO7C2CYW6j4Wo4P4vnOsETKQ908s3LlySVYSrPpceOMS1IERoci1/TvzeeBjdcazBYlzn6I4m0DmSpR4sN4K1j8h4RD0d7by8g4RSqq9bDGwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437477; c=relaxed/simple;
	bh=CargpKkXQVqdsSsY3ImCivV1FVq/9kbtzLrmFN/ecrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q3ws8S7Pt5BA7CjdgPuLrBETMLvo3SvMRSl6Fs9UHx0LOxM9sPZELL02fcGdWDur5j2EM/NJtQuY8Ex525oLjKW8QagHOdftLhw+p4O7jCG5JFq4yfs/ETGo+Ik6d/gbftyuhp7b8fgKj74rPi5tNnTRbyrtZW2SdlNaqtjDGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j049FK3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnnlLIz/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621LD4k6055174
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 07:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=; b=j049FK3zsgLaw4ZF
	btm1Nsv0yyg+Qz0mgUPNdCloRTBjDeY6vL5kOS5DnsBPbd0hqVqe7rn7EBE4rR0f
	EYC9E0qfWbvjcw1paSUzMVBbzULewox9x3vzDhPzCcrmlsHmAy7XqVWOnCrtF52r
	gkyBXeojP22EVX3hOHvHcCBTzAjlG3AMa4qVMQQxsIrXUsuYrN1dqrFzp9KIZvQA
	rpMl2z1TOrNJFhw7Z+fcv0quSka6xXVX7157KF0w6BS0JB3b5UUw2od8/K5Yml/y
	xy2/yOotvq4OviyygVgFCATvLjk8TRjdlZdjYGiIIVas+a8nndbmUiyMWb9eIdM2
	j+uYog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw6499mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:44:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8274dbdbadcso10262419b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 23:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772437475; x=1773042275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=;
        b=SnnlLIz/dqJGMuY49YY+1bafRm5l3jPKQ5Mg+e0GW+O88pHBgLKYggkD+JKDf/2aNn
         mpvWDyV9hWTNBgC1DApTj+Qih623Psn6sPlvW42nugfYOnB1Cpf0eWD6AUIUPIzeA1NK
         /FioZRh1jewnJgjEdJZrU+lvjKeqk0jo78BxDJxNKYgrMZgb/CA9OBgWWB1Z7QGnYVpb
         Jq+WCVayab6+G/I7LXn2GfoPLjr5ZXZZNCFT7lNohVB1eA2RlCO5PMUy4KcKElVgpMRN
         wSSRQSqaPIH/HyPIOSozCTb00U6KZ4uxSgb7PA7qtiqP0QZQIxKVTLS73Im47zsPmoIA
         btYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437475; x=1773042275;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=;
        b=GvICMJYLgEn2Ql36cwZG1+FOleLk6ZaoLYKm0GndR9LWVDYl9Fo5zG2SPv+9PtuIxI
         699QMR3Cn4zr9gok1392Ppd72rSe6P6ib4ZvU15VdtZInryBFp+O3DzkAoClgOsVuomZ
         uJsRFoCXAPBgdJN4e/bq0F4fmNSxfgjMijJjegWezn2NzGV/cVCOFqq6U4ttXZiYpxou
         Nqiu0p/N2CCV8BFuz6sH+TbWLNlf+MVXrN7RyrPDZQ13rghjt3KfgVUKRCcrQoLt+w02
         WG+HwoweWBBLIe0ACX85+r+GijHs50mF2/JnJjr7wVFaFV04Cx8wfksqRkNr5e5ea0gR
         gITQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdwOle+XUorpvEImuTVYDNkBo+fqsnCCTfV8Md2BkM2IbQKm2ngVcUda2vdH6cA4khglV7L7r0yg4J0y0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9F2CaZ7Iar5IHeFEp+EfpvJgHz6R92Kj48SgzlsimpEn4Pqy
	PvFUveVYrjPYAv+axw7Cg5iU6xinNUprjqsuDBnZkwYQzHOvDZ/wkqgBTcJSGEZ543IT1FovQZP
	LPrG65k/Tx+DpOwsGU5UievYtNVc/3tEqwYXSmxt0u7Ld/tsfNJobimN/wZ9F7NmFAWtBua5wRr
	GU
X-Gm-Gg: ATEYQzwJgdEkuBVA8f+SLGxBMdmSZQ3VFit2z/VS/4tElCKzUkRum3zLRV+f53YZL9F
	HjG9HnOf1IglwE9tl6FruTyU9VALPjLe9iVwTDIE4tKP7xucQoGMGS6HUKz48vd6b/gWAM+/KWP
	rJBkbdukDp7Lk/mo2ilrYtGgnEbgpSdM4ur8xws+sMth2klCdIpI4Had3h0Oq/uMHLZtMi3L9X9
	t5x4C2pGXenHFGG6ReBwn/lQt7X1lJf9gcU2vqzp+alF1HgoGRSPu5W4plRTs8LklMkUPGH+sFp
	3iR28zKc/+WOxjoW4cvF+jmfcXr6pEpMIKwmIN9WbBSH+dV7iWN4okPKYNPr8ktXmtq3IT3sPF4
	iyLCazylpSvEz1KP0jdg0k8FzcqNI03c0zWj+DgbYXFEztwU=
X-Received: by 2002:a05:6a00:2d07:b0:827:2a66:1fc4 with SMTP id d2e1a72fcca58-8274d99ac37mr10028168b3a.28.1772437474510;
        Sun, 01 Mar 2026 23:44:34 -0800 (PST)
X-Received: by 2002:a05:6a00:2d07:b0:827:2a66:1fc4 with SMTP id d2e1a72fcca58-8274d99ac37mr10028152b3a.28.1772437473995;
        Sun, 01 Mar 2026 23:44:33 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff325esm15046491b3a.37.2026.03.01.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:44:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
References: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Message-Id: <177243747142.16822.11221032397821014097.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:14:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: VoX1GRChq7h8Gyb6nzoAxjrv5rLoIcM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA2NiBTYWx0ZWRfX9v76xSgLtXAX
 BIQGiH+jZE1NIvBxO4LUEI7OMyUVh+SM1x7Azyes6/Oy4SrIUHt0jVNlL1Pqzg2mrs8enxK2H/W
 bl05rjipfDr/2Dwv73ydVTYqj4ZHV566eFuw2rZoVVmhEwmonHgK1MyM+y8MztbCCuopScncayD
 Fg6c7bhyZDJklV9rFN91Dvf0k6v2PluRjkOoUqLQ6WnrWK4vmRqGasq3ba5+7aMnQzDX6X8JoHa
 tvMWueSvwJbSv2cqXRo11lDDqEIxR4mO9evSwuGbWkfZ9LOKLrOxxFkOlj+0VWMluuqmZzkEsQf
 HZqVuJCqa+I4E7PVUzc1fH9/cPAuaWL81X90/fEo7HedFmzZyN/g1ucPdg2Etpxq2z7BwJWSxN9
 Bl3s866PgfJlgDQiKBoLASOWPhSdkdrmXJ/I87JowtF9wue82LYRyt5YaIjdbn/nOlfFUsLsczO
 HXIwvjtSYGx9yRKrHJw==
X-Proofpoint-ORIG-GUID: VoX1GRChq7h8Gyb6nzoAxjrv5rLoIcM7
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a53fe3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UDMOASZ6n-RK-qn-_IkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94786-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59C141D4182
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 17:16:17 +0530, Krishna Chaitanya Chundru wrote:
> Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
> transition to ready during power up, so use modem_qcom_v2_mhiv_config
> configurations.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>             Subsystem: Qualcomm Device 011a
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
      commit: 6a7084102bb9659f699005c420eb59eade6d3b4f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


