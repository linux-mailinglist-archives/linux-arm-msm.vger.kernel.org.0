Return-Path: <linux-arm-msm+bounces-115731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1adTIo4lRWot7woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:34:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE16EECD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:34:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Te3dOX/o";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kl5AH9gA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115731-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115731-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DB930C8980
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A487E33120A;
	Wed,  1 Jul 2026 14:27:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61D34389B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:27:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916047; cv=pass; b=iqajYULGzr/dwpAmnUvOUGT8WCwt54dksbr6BHQnHMXAl8KwVoPbJbG0+0cnFWpfWHgXs8y2ZK/D1cECtIFSRyt6q1zqy5+6zJqONvyDo6pyQOgiYskQAEAmcdeYFWZdbXbu2O31UZLdMsNaHWzS8Pp/tEhWGHXJrJ//GyCBkJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916047; c=relaxed/simple;
	bh=o5hJ4zjdUnOfv1QaEjf+KgFzHDm/5IZUg+OW0f16z/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPCayhEmdJBHq9Hm9zn73GF4lLAGXuKTkFZDCH/lJyGKpomM6uvQ+/6UMZZ1EEp0h0v/ENWwZIW4+NxJG+8NA3ZjtJNlXI17XkGyzs5pS+xpztBB/OioEkAVdf6/CjjlZWZcSdjvrP2PSF9NB5dwnPhgqX+h5S8RAYcdDSxW9/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te3dOX/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kl5AH9gA; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VfH744114
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=; b=Te3dOX/oMm1dsiSh
	NMdFy2Wpu3MOA63ZucRuVwxcW+Nz7k9jDJhweSvRVVAP5QWCY+0AYmgxnV95hlJA
	W4LoxGz+hblSca0DMxszJKqB5mZ2JkPjhi+Oa3plAjM54WeaNR6Mu0WI9LjQACDc
	7v7bIWwjNhfTK/7vtsCevwB+TldVs0rK3QjSyzHKuvJ+afwTFlC1uQtqY9R87r14
	gK2H+Xm+7fa4yJ2XsTVU3yG/WkYwvhKkR5rUch9RgKJYlPZlFeba9JVTPJWl+hDL
	fu0Px8Qe5RvibYZ7pqCNqi50pTzCeRajeo66W2yVfs5zoLYtN08YGyLKG4JDlGm8
	sHu3mQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thyc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 14:27:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so71855185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916044; cv=none;
        d=google.com; s=arc-20260327;
        b=QuoZJIa6qtM4iQKb6r8+bkkxPxJ1fMbj910rHlp3bxYsDjT5UN7fIa0Qa85WIbkHsr
         +UJo186WrPJ7FXn5Kz9G0bBB0AAWCo8wjBdvO2G5H60gwJG29dzFh0n0LohKVUVsvJCc
         lHpcjBD0qeBZSzn9QZfH7YB9ShPhkB9kgH645NScHR4utPJeP87ternTV3OmH8Us+W/A
         HS/3pSxrYQWOc6XqimOANRBrDZZtixKGYCbCOAjKrnGKAaHaiN4Snmmy4b41jaoy05pn
         9PlC/NEdOGEkmNUrJPSpoZgMzVPxnMybxSt+CkDgHS2BGvzFFo2+m969+YiYjpEf7K3p
         cteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        fh=ERuHU79BP/7cJ/lImAKBXnTd9PmL0d9qgoVux8U2eQA=;
        b=eYpODpI1bmsKokJACTXza8Elf97FeSNS7HAB3QDxyslt1W2ZqrZEZm85r3NU3JCALr
         FdQL19QDSFYonvgOnXEmpzOE3W7KrNYccYi9UVJ51CkH9C8HHrt4hOuai3pNaweRHJ5J
         wMuACSNZcl6AElQZ5AE+yXAMhfcnG0uu/5Tn0cfhqtaYljSlggObjleKEFnFeZ1uW/qs
         wMR9STejCBfzhkaHZj9gU5XNz+cVeXSF4SCCxJFggFc4Qs/ia8lXS8+sdt12IUa3Y75t
         CDlKxvOQ7iZ9fu+UPxHbIxY1fq509bMqh8eOlR2f0x9Kv7MIBz3gJG1qugfaODm/d4aL
         1WbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782916044; x=1783520844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        b=Kl5AH9gANTalDVZar4+xp3tmV8gIEl6SHvFMJ21yCsnCg/UdDIvq9mxkuW2DwDr0H1
         XDHsdmbGrb1D8rSJMIENwwiRyrjlvV/eoPzHWqM8HjvMqrMHfOgV+34vnN5XOkufTTxK
         tVndNGKl/E6AG1s5BjzkS4USEIHyUv3QE4/KxXjouk/tYiaaXzMDGhCJfY6tEUUKLRzb
         odOQ3/fFAZ+IgG0qNBJD7QILLaPVzNmCNZmBcXuhn3iTEManGk/sEj9oLRP7GIRuoRV8
         9rIwrUB5IIeHLTBqBu/V+ekjEmsBBXzl7fJepu/Brqi25yhdJW/l5FPrHXPVwECgWx0U
         rXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916044; x=1783520844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        b=oTsEX5WkR41n7OCjCcRvkuX0+NCpCIi3ScXbvksGnuOyoc67j4Oz9+sJsM7mZ+gjrx
         E5JzpvwRIM3RB1D6jBjc+zg3Hlh/DfixWM83QCh0DaHxwBaswyl3wVaUEIC2NzUOCSDe
         EeCFRrW4GEcZ6L7e/1zsThiW4365Htf9y0rr5xa0hKgnnl00spZog0Gog7ASebpfm/Pw
         Fgm3gHeRxoUupM9yQCz5khUqBI31SyybBKlNtWaauFIMyB7/35qltS70S8PrOVYGv8KD
         6EY+asX9tS+cL8CTtuwbeiEeo3HUKrnFAZRGUlOLPc8xnzkBnUkjCOqg9uyXJewI7DHB
         MEpA==
X-Forwarded-Encrypted: i=1; AFNElJ+y2MB/9/oIyFUhDuTC8h3UVlczMEOpLbPeLcSwtfHPVikFCWGd5UvfUK6U35OApK7aiHWUkhVKBsaloQeK@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsXrtjHSDR2A22Eck41EI9OxeWDZ6lmAfanq8yb6esQsl89UJ
	p14SoiceheHE7BpxHufrv/ei8Ftxue+FrC3QD+TrHD5I5h+UZdoe1Q76TnAN7Hkrg5aLAyYyHsI
	snIJS/SMg7wHFx3FybisBKJ5qOGDdaOEwsI+kUOGlwzqftf7fLOXlhcMb0cIYQem99bTpoQCOhZ
	0SV2+iyaiBq0Usu63iog9dOS1dgWkDWQd4aTMRZEVp8g0=
X-Gm-Gg: AfdE7ckK/qVfROoWO77LC9L4uLpb8F6ECjtWVXl68+5MSB4EPHKtSD0ZcjokddVphRu
	1j/0rHTxWZtWCR5R+ph1nAZeBaxhVLgK+t+/Br6/dARI5ag8nwJV5Rp+Zj6FbZwANBnpe4KLCGr
	ozjNAwwQT2VEixHC0JHdooK8t9m2ye2Xjjw10zoAVvfm/PNSQxPqQu4jydNbpNKZNCzAxVhwqKw
	r7K6allp1sF1y+A8xpif95RTCtJ6YS5lDQ72UoyFBSkZtna2PctBrQui14KI7UUTqO7vTF4JJ7U
	c6zjetENuQ==
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id af79cd13be357-92e781d35e8mr268234585a.14.1782916044085;
        Wed, 01 Jul 2026 07:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id
 af79cd13be357-92e781d35e8mr268229085a.14.1782916043639; Wed, 01 Jul 2026
 07:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701095344.309409-1-zwq2226404116@163.com>
In-Reply-To: <20260701095344.309409-1-zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:27:12 +0200
X-Gm-Features: AVVi8CefzM1LituZvWyAk0MJEQ4HiP0taqRwbGukgdhVHhBq-uNWIgfCAUrAGm4
Message-ID: <CAFEp6-2ZPRbakA7wVHnaqMXgPnEL2BQ_gAEQC-2mH_=rOjHY1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] bus: mhi: pci_generic: fix Rolling Wireless
 RW135R-GL and RW151 support
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        mani@kernel.org, ryazanov.s.a@gmail.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: W6-eA_QK0lS4RiPe5cRxxvwCvUGnCvHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX8O6lEjU9eI3P
 pMz2EGV14VmwZ9RjioJPtqsTMJgFrFYKN77kDdWMYe9Q7gYYofBjoXAFeTkVS0IQz7rgnuyMk8j
 U/NmVO6PJhIA21XFw0xKoMiBzUJ9Kh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX0/7+m/n0gH+z
 bGTgyfftbyFI9w6fgmyAaCAfEUeHMdVy+EXgsVv885AxRM6qpTctrhkVZP87Mi048ixPzXo8eZN
 Pva10NsfsbQ06JFam2Zhoh2V+srYXVBrMKnJTIIVh55vGHgaiCiXcQq/jyEeyrl/4KjOLQ6H2oW
 DzKhQ9OWYhvNWI+QXnREaoy5hbcj2SphIGAgVmATS670/WRsEgtgT8Ets0dn6ajUzjKpeCKjxwy
 3b+/nXY/Y4NA5oPSSZoYXaG4KLEowYitRy48rVzzc0SySs0XdzeVqwCnUtnkxd97sMkSL2dx+Ut
 S4np0EyDG6p77C9H064N9eBgI6Ymii2r/LHVptpoRNyW3X8ttep5TYa9a8PvvrKQw1MIEUpGnqo
 B0pOBd8Py7BnAq+RWO3sSDfKkZhuEDj8aVYLBuAb1TE6IGANLOKEB/ZfeEZxKvLOJHKubn0de77
 HDcNgOmoMAf7EAz8s2A==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4523cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8
 a=nWUtx5Q0ph_BRYhHASsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-ORIG-GUID: W6-eA_QK0lS4RiPe5cRxxvwCvUGnCvHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zwq2226404116@163.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,gmail.com,lunn.ch,davemloft.net,fibocom.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2EE16EECD6

On Wed, Jul 1, 2026 at 11:54=E2=80=AFAM <zwq2226404116@163.com> wrote:
>
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support
>
> - Increase RW151 MBIM channel ring size from 4 to 32

Why? What is the problem today? If they don=E2=80=99t address the same issu=
e,
they should be split into two separate patches.

>
> On HP and Lenovo laptop platforms the device probes successfully and
> WWAN ports are created, but pci_generic enables runtime autosuspend
> (PCI D3hot/M3) after a short idle period. Resume from runtime PM leaves
> the modem in MHI SYS ERROR; driver recovery (reset) fails and the device
> becomes inaccessible (PCIe config space reads as 0x7f). The failure is no=
t
> self-recoverable while runtime PM remains enabled; keeping power/control=
=3Don
> avoids the issue.
>
> Set no_m3 on RW135R-GL and RW151 so probe does not enable runtime M3
> autosuspend for these modules.
>
> Power management testing (separate from runtime PM above):
> - Suspend-to-RAM (S3/mem): tested on RW135R-GL and RW151; MHI/MBIM/wwan
>   function after wake.
> - Suspend-to-disk (hibernate): not available on the test platforms
>   (/sys/power/state lacks "disk", ENODEV).
>
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> ---
> v2 -> v3: RW151 MBIM ring size 32; disable runtime M3 (no_m3)
>  drivers/bus/mhi/host/pci_generic.c | 4 +++-
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index d598bb3b3981..d0fee7e3ba3a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -942,6 +942,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw13=
5r_info =3D {
>         .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
>         .dma_data_width =3D 32,
>         .sideband_wake =3D false,
> +       .no_m3 =3D true,
>         .mru_default =3D 32768,
>         .edl_trigger =3D true,
>  };
> @@ -949,8 +950,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw13=
5r_info =3D {
>  static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
>         MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>         MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> -       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> -       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> @@ -986,6 +987,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw15=
1_info =3D {
>         .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
>         .dma_data_width =3D 32,
>         .sideband_wake =3D false,
> +       .no_m3 =3D true,
>         .mru_default =3D 32768,
>         .edl_trigger =3D true,
>  };
>
> --
> 2.50.0
>

