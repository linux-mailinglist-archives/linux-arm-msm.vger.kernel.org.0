Return-Path: <linux-arm-msm+bounces-110624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FhvFl+jHWrmcgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:21:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D5621902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EB81306119C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0591E3D9674;
	Mon,  1 Jun 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYjbyKHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8oJAe9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20183D967F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326812; cv=none; b=sbpocDcy6f0thByjq9ubR+1xbg/WCc2nufXpb4rOEgEc5ds36o6dJAlQ9BN2cAy5p4opnX423GUDCYEFzf6N6vYvsFVL4zs9hZQ/5p1xVrwJ6UEQ/cZRVEBlgcBkSHS+HZWC89pcqyrc6IV3yQQDyB5PRL1OCqVJJ8vsRqff5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326812; c=relaxed/simple;
	bh=r0+aCzNBWqpfZkcJMC8J4KdHaiFjjmgp8w4RhjdUi30=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=NQzf4gRZ0kMNKtv4y+HTWtoNPjPUOsvYvMjLwmpykT8P4TQYhN+9zp3Z9br7pFmovwqTUrHx1SGJ4srdjPpXPlxfurZodQ/djSe2duCMwzgV9swGmgwTchn8xmNX3qUGHAOkVr0IXw9vcmNaqCwirj3hR5DrD3bTo2j9Zuy12is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYjbyKHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8oJAe9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM70j622454
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=; b=RYjbyKHEOfptoxa2
	kRWEeQHJIPHhn3IX6WIJ0PTUcElg4GClm5nJFvdUzABhJ/KM5J9g5ezP9Nd/jiPs
	SpYMs0QSjeqBtnDoYtb2HQfNCR4eDUoWSRdIT1BKrIjvk2LAWx1HkSinVjl0REfv
	LN86JJB1kgl0Ciliy/qozAkZd7wSvih2gweaA3w8n3hT80VxqcW125c8J+iOHrP0
	KLn/WkTIyR0vh17KMRULiO6D4t0RdV0FHOgmdLxkAhsElUzUxetj33jF8ne1mmQz
	ZKTQJGMLN+wXaITan7JUM5UZYMJWpC8pFyhT93zMoCGvf5xMnlpXgSe+yVkIvqy0
	FHbQtg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954h0nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:13:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1649957b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780326809; x=1780931609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=;
        b=D8oJAe9doR/1vnfE2Cv8YYn5jXiSeaBb5YXQi05UurXCJVqB0TxB8Dgm/TzdCK4BCI
         ZgS7yDFzLU5SaTZeAhjHwbi5lfbYSFOkd+PWSAGB5SlQuazXkM4D6Q8ZPIIzsrCfCfUN
         wG/AjNTxVlqSl3q9Ajrcg/Qwrr7bKah1HAfkwc2DD7vBQ6hvDtx3wcVHwz4doOTHwSlF
         1dj2DK/xNWIL+a6WboPVkKEpBeT1YgaJCeIdOh3VMSPfOquD75ql2uA2fr0VlSG0dlas
         m+fEgFkFhlpCIw0DnLazasICKEyiKqqkW3BaYTl18Keda9mWnE/wDnVENlZtOiRxRkL+
         icTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326809; x=1780931609;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=;
        b=CI6aQjtO4dO7BU6cFp8Uu26DHJa70dvvHU10+zRjTZbwHlqt6n9/uhRGljLcoj+SGa
         Gus4lDy/uaChfzpTrWZwd5NjqeVdovbF6imvWgwUPbCM4ru3v/Z/dtR+e2ptMcXViaaX
         fF5ig/YdCkMMHp+JiDQkY/lPSMdqBR9A7Maazy8/Ns0hbjwjzwpvep2eLaBfTxPPoW6P
         DFf7FwZN5/xCa/5/WxXPw3OOG5Lv3o8hXMcW9LzPcGj1NGmRlbjpLDaaW9zt5pJL9Dnx
         psrkS8jzaJHFdS85KY0/SFsLc941/dZstJXygmkDKsfSKog4Hd/o8KuYA0rXMlvR1s/6
         ooOA==
X-Forwarded-Encrypted: i=1; AFNElJ+ek1yFfWv3ie5JIxTFV/Hh/0u7U3vHWJZUT2pO3hhWy3UAipkOhdz9FeeeuZxTyfOKkGuO8fRle5ZdudYc@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+qVxyT1Dw0DkGL3IWjm75wjhTovbT0R51bEDKn7qQ3JGaXPx
	qZKyimkihRbGypvW0YCfCT7VYFUCQgpJtGQPkoN+KxmFsTY+R5uCWmVOlgwsYnXyxDViFDGS2G5
	+wayui9R46YFj6mUOQYSiKikO30E6Z0lyfd9ZJPUMlKVsJ0/Tcyt2/Idc4KGiY80+n9Kh
X-Gm-Gg: Acq92OEJ6fIo1rn6nVc0qKvCi6Eh63a9iCt7QPeuQ9gUOOBjhGctUlfHyTKSG9NGXoo
	4aaWXBJuMpDQ2jaf2/xhN2Abq/Q0F9e+vNmRBLwA1rNN3/y5Wx4+FsGZ3gOFNYBVz+ukOgzmnAG
	/K1R/9vPz7Da0g5JktzuI38qKCHmRTKB24tScgEWU1dCHzu7NB73DL1lTscZov/z91F2YAO7aJm
	j50bH8tVYLoWKJgJS+48wiCF2ioZEuiRkITvESgwNZjh1J0NtbVSxPIw0Tpo2dugrM03Y1wvuaS
	wUzfq8rKZ8lS1k7gW52eGhYQ/zRpKGk05idBXTmo2v38Fl5nG2Ev8w2pAX+tMNx92i0voKj698x
	XyEhWIJMKlQnGFqEU2YBWTaQkRHrE7ZIe6PU0zVdr8JbCyA2Lf2ppgKgCRkVnPfC6JdehkNf0NS
	JtRpjCGpSG1HItzc1gGtAwE6Jpr/I=
X-Received: by 2002:a05:6a00:2d9e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84225700f47mr10727550b3a.42.1780326809360;
        Mon, 01 Jun 2026 08:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84225700f47mr10727514b3a.42.1780326808761;
        Mon, 01 Jun 2026 08:13:28 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm10691086b3a.39.2026.06.01.08.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:13:28 -0700 (PDT)
Message-ID: <ac381274-f50c-4db4-9e4f-436d1d3cdbb6@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 23:13:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate
 CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
 <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
In-Reply-To: <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t-RcNp6-zfT8uZq6emvpKEoIEdcZImsC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1MiBTYWx0ZWRfX0byLVb0vdezm
 kuOrgPNzF3bT4yRXvu7t290jN0q2bj0p8UDeJbMV4XHEEsdAt2h/mnZlm3cNMumib51EH8JQwJo
 z1hgiyRHsHzZ1OmpC08XNQV6b/jAPURKy7QD6QzrrJSoRjgqri8xNp7vFNNtf9AYV320jcMiFra
 4TcffonFU0f5C21USkIhKCnztkutA+sDQ2yHtX3BOHf3r5qqZ3UO2U5bYo425W1hUaxfH7UCfoA
 EpVSdcEl2+1LOKlYLEgUJ0ZRwSgRGOztyHWNtG5VenpD/AwG1sBvxvi3gc/hMIosX4mABQcf9qV
 wCt2MiOYObLzpcsobSDpaj306t1LiU01srRuOzkPaDZdZa2L6niA/DVHLSewJo8zk9/QX2sgYWL
 +wxtCdkUdZ0lPoQVFrmzcDUYQQLbfOogWf6HCOjy5Rl+5BAofGghy4GkehR4W8kGnh2jt2ZfHle
 pDIwzzlquOEix2B3Bmw==
X-Proofpoint-GUID: t-RcNp6-zfT8uZq6emvpKEoIEdcZImsC
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1da19a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oV6xyBMvY1brQq5Mu-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110624-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,vger.kernel.org];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C1D5621902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/1/26 11:04 PM, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> On Mon, Jun 1, 2026 at 4:44 PM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
> >
> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> > header. This eliminates redundancy and makes the constant available
> > to future CSID implementations.
> 
> Taking that direction, I don’t think this is the only instance of
> redundancy, so why single out this one in particular? Should we
> consider one-line cleanups across all similar cases? Also, other CSID
> drivers follow the same pattern but use different identifiers for that
> define (e.g. csid-340).
> 
> Also, introducing such low-level, register-aligned naming
> (CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
> CSID header doesn’t seem appropriate.
> 
> Regards,
> Loic
> 
> 
> 
> >
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> > header. This eliminates redundancy and makes the constant available
> > to future CSID implementations.
> > ---
> >   drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
> >   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
> >   drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
> >   3 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> > index 345a67c8fb94..bf7164085ddb 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> > @@ -101,7 +101,6 @@
> >   #define                CSI2_RX_CFG0_DL2_INPUT_SEL                      12
> >   #define                CSI2_RX_CFG0_DL3_INPUT_SEL                      16
> >   #define                CSI2_RX_CFG0_PHY_NUM_SEL                        20
> > -#define                CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
> >   #define                CSI2_RX_CFG0_PHY_TYPE_SEL                       24
> >   #define                CSI2_RX_CFG0_TPG_MUX_EN                         BIT(27)
> >   #define                CSI2_RX_CFG0_TPG_MUX_SEL                        GENMASK(29, 28)
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > index 0fdbf75fb27d..da9458cd178b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > @@ -105,7 +105,6 @@
> >   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     (csid_is_lite(csid) && IS_CSID_690(csid) ?\
> >                                                          (0x34C + 0x100 * (rdi)) :\
> >                                                          (0x54C + 0x100 * (rdi)))
> > -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
> >
> >   static void __csid_configure_rx(struct csid_device *csid,
> >                                  struct csid_phy_config *phy, int vc)
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> > index 5296b10f6bac..059ac94ad1be 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> > @@ -27,6 +27,8 @@
> >   /* CSID hardware can demultiplex up to 4 outputs */
> >   #define MSM_CSID_MAX_SRC_STREAMS       4
> >
> > +/* CSIPHY to hardware PHY selector mapping */
> > +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
> >   #define CSID_RESET_TIMEOUT_MS 500
> >
> >   enum csid_testgen_mode {
> >
> > ---
> > base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
> > change-id: 20260601-camss-macro-3d40c4d4e90d
> >
> > Best regards,
> > --
> > Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> >
> 
Thanks Loic, Bryan pointed this out in last review cycle and suggested to split it as a standalone series. This idea comes from KNP series as I was once suggested to move this macro into one common header to remove redundancy. I think your are correct after fully consideration. I will make changes only for KNP and put it in driver.

Best regards,
Hangxiang

