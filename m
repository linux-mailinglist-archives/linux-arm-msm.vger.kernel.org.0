Return-Path: <linux-arm-msm+bounces-99369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCjRKPSIwWn+TgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:39:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0A2FB69F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4853323E04D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484423C9EEA;
	Mon, 23 Mar 2026 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbYWim+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgLw4qM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238393C9432
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289046; cv=none; b=ckYuDwNbULP6Mj5gCy1NwfvuAhn12GWNZG71mPDsoHC4MxISBNqTRjv8hyl0jLn0s7ajZjnp8d+3s8EaunIUeRNzpQ/Ne53ns3Sa/bTCq3AQfbsNwaFxLjUNqa1KzVA8cFncNrcbHQ0ilrC04E6DZAu5MclgAlJ94fRhmaiSirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289046; c=relaxed/simple;
	bh=nYnFveECu5ITFAyR2yhAkN363hpP0FYZW3sOF/XvTns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7PLIrOkDGIqVnSm1BwQcjXA7+OLES/BbjsZmtRoKJE3YWwgmmmlwCKr2VcrjOcBm6s6h4lRDoxiIoYZyPaKONr0NStlwMkye5w+GuAuyKwfqMTKcoiAo3INUgvBIr1fhrB10Fng8B2bPSNlmiA2MCtmsqqga2KB6rzCqAhlhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbYWim+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgLw4qM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHquD7618658
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6D6USV7BY5LuRMBJnmmvmDBp
	FpnRg1a11Ks57MhK4GM=; b=NbYWim+UWz+1Hzk91j8t2X9fcfUuoMfMLtiBvknV
	UQUELYLkdwbXEkhMglvUaKXJy2fxcZVVSMwkD8fCVt9hS896y8J1yQo79UsxeUAG
	6p9pLTqOXELD0qJxQfiKxv2cUaec7BO02wApAqNqbA0ocjNTNCuVEO6dhNiQz71a
	vTF5UCWER1DEc15qkF12eWgBdU9mwqEV4wWZSg3RMojPPZ1UZjs/zGyKucEnrx8r
	5w7B/YOQwzKo1mtrOlFzMlRHANKkG4HodXmjfk9DvBY8WbTmVgBJxg4WE9VLbPad
	JtPHggPGVQosIth/fzqrKthOlzx10ws5UoX8ZJrs2m4vAg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgj6ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:04:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56cf1790811so1751169e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774289043; x=1774893843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6D6USV7BY5LuRMBJnmmvmDBpFpnRg1a11Ks57MhK4GM=;
        b=GgLw4qM+jKd6GtB2q+CQtiQjZlha6b+dWcaiL/utZWhMsa/7yC2hQd5xRQIqjS/ecO
         SIgjEJbEtWTKl83hfBphbxQrqOqnIo5TXxgGypwhX1jfuKjv1GxXvU5eDc6U5Qrdnpvg
         pHJwx+TwKQNvztzOkIpllBXtx/+NjJQTcxTkI13+AcZZr+VoTiwkkUSVQbBiCuGQe8yy
         RTVoBBoB9O93UvBPg4vj1TMLkQE0rWkRJ+REdnH8FV3K3795XCZR61px3vwaadiwO4pV
         UGK65i6gVsIuecIwg/caGpvofFj7mTMJjWRyLn+0C1h3w+v3pVGwDwZ5tUBpFRtZVIPF
         SoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289043; x=1774893843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D6USV7BY5LuRMBJnmmvmDBpFpnRg1a11Ks57MhK4GM=;
        b=DjGCg8iEqXuAQzL0AgirDgWeDghYeUQqsC4+kiJ9hdubDYbNmSgueHHe4agnZZ+Yu3
         qV4A9w2acxhKvTr1yFajSL7t6g6K3vYKnR6UFYrEOoYdJuJrKDGuDLzxUrlpTMGd7vSq
         Nwqwkgwo+QG1HWDQA1oqjSJfsU+VEqecWzfpw3wRhskFRU3+kQxaeUJhRMUnh0lCAw6S
         85stOud6WkbYxJq6tu6lqOpTmtUsmnqHl26IgARGCYfCdqs0Z9aUYYLAygKPZNu781nW
         0MfGmAMhkcej5MBkeuxpLttbAmzgubxgmgPwzdg+Y6qEyxBJijz5l8OnlDbzHpjbs5Is
         3zpg==
X-Forwarded-Encrypted: i=1; AJvYcCXpMwJGXf+p2e3N9vv9gMCCTgiTLYZDCpi2OKUBR8gCeiCrCHh+aJZRdOgk+HI/P80jj++dIuQmPDaX5DGm@vger.kernel.org
X-Gm-Message-State: AOJu0YzIWljAPL8n5XiSum4av5NUzUcl2zaGaciU/cs868jJWonnC282
	OMwoTb2PGmI6C6NRG7ZNtC4WtmNWuiTUCetplAbCQr2QYSudYH2bR6goQmDHuhgG+cQ9XZ/c+lJ
	a7KLIc9YnC5FpZ/uICRsUuE6nGGiXLOtnYZGI9dunXHQEwfVACGlnlK+fZ8R1diIRqN16
X-Gm-Gg: ATEYQzw6v2MUfzwkCtf6vpC0llniavl+No+HTY8PfPq7ifoWuGa0fB8hnq0o24k+oPQ
	VpVnf+Vgn97PSt7NkCKHitZft/OLPyWdsjeutEvBNySNgso5aO+VnyQ9ueS26JBOlNQyN7MIS8k
	+xm/qvINaaOizH8ums45wGVNWMVNpcYW29XZ6dpGv72vCUgdY9Gc7IRJlOZ8jrYRy+Y6YvLf/Cg
	HVY6C9rHvc+wAVrE3NBj3Cb3I+ssgi5LxMEaT+gpbvifjcjZeFVUKq2Mz/eDYDwCYtfyqPsGBEl
	T/TSgFT4j37D10O+ye8uExR9/ZmgcL7OSxkrA1i0rwjib716qTC63/mb6IeHhh25Bit3gyw4pPd
	4vtuMRcEkXESe7STssIdTVA/4Pf+NoCU/Sg==
X-Received: by 2002:a05:6122:208c:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56cde447f2emr5977614e0c.13.1774289042980;
        Mon, 23 Mar 2026 11:04:02 -0700 (PDT)
X-Received: by 2002:a05:6122:208c:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56cde447f2emr5977538e0c.13.1774289039892;
        Mon, 23 Mar 2026 11:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b243sm31857646f8f.26.2026.03.23.11.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:03:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:03:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Message-ID: <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
X-Proofpoint-GUID: qeG2fNMNbqH-ydGh0orpTglPIdT1j8Uk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzMyBTYWx0ZWRfXyR99boh6qrS5
 iZ+HDv2W2j+e1rS2IRFHhZ44hLpyaB+7CiGbZ3guhj9/Ipi6BI7EYUxm3yxxdaBQuvuPBvqt76Z
 26LwVDY0QJPbu4cG+W+rlaCxTU5LvNyKJyVvnzXZf/iKmo8me3Ho3RLFxoF7quQ+TnzRyUvT1gy
 nbLm2dFQOQVnmXDHh9EFM1iL0v2FDBqCLGhQGIOCXFUIkGP6HPOkOqETqx51OSE/EYIcbeOXNtb
 Bfn97MMWXBHU84sM6hk+BvUqB+o0g9nxGg8XAwrhogMxFyBycKoYY+JXqqWPnNo+BqjFVoLidOq
 h4MCp0xfuPlkcLTk/hRxQy7nao7HUG8U/16kTDBOicT+hCzIILRQMMokQhLZ2ughSRaebLJqvcY
 ruxnSEdCBs8STyA0CRdUz4AkBae5BtyMhkiBrUkBRKPXPR3/fDOH5+I75Eusdl4wXr0gGS9PNR7
 b8Y6Qzx2jjbXXYF82qQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c18094 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=42MeAh9OZE-JqNhjVH8A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: qeG2fNMNbqH-ydGh0orpTglPIdT1j8Uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230133
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99369-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03B0A2FB69F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-22 18:08:21, Abel Vesa wrote:
> The UFS MCQ mode is currently not functional in the driver. Eliza is
> the first platform enabling it, which results in UFS failures at runtime
> with errors such as:
> 
>   ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>   ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> 
> The failures occur when accessing the UFS device, while the controller
> and PHY initialize correctly.
> 
> Disable MCQ mode by removing the corresponding register range. This can
> be reverted once MCQ support is fixed in the driver.

Nitin, care to comment?

