Return-Path: <linux-arm-msm+bounces-106944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGmwKEjXAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:19:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F78850EBD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13400301475B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A19D3E5EE5;
	Mon, 11 May 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjxgDUpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBVOIV9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3532D12EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505408; cv=pass; b=Afo8VUcZwrPpsgmrLIuKgs77/jVD6ovjappGEc6r7iNTeyCicqRp9YKwefHqsMEIX8tiiaY6MOXoW5udpPJG749jazsrMuSHSJ3R88yYk6DDsWmpgS75xgEessdkdmvxd2bkPsVhC9gHI9IWpTqC10jg4Ubv8LfcyCXjWsL0PVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505408; c=relaxed/simple;
	bh=WEsj+vebI30YUY3vXN59gmZW4bFRME7DDSmfsOWGjw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2v3XOf4pONBpBat8gMxhBYGcgKlPcnpQ+DAHwVu56qI00/qC1N2aCdbyrLNophYdRNki6z9uDWz1pplkz8GVFPTqBcXwOxlOpGXIeU17F324tfKV0nDovQfrdtGFqyy+66+5F7Qpmw6GrQbjA/5oRwEEt6XhfyfZHd9VbHYtDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjxgDUpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBVOIV9T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BCaJXC774891
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jKC4fA5XoPXj0Nn3vhDjLseDL92E+p2MaLlggox48iM=; b=Qj
	xgDUptZiIZXuIpBuj6BboId3rmKT0N/QwyeVWcz/U1tJeKNdAXIwm4Yf0E6Nr7Pb
	YO1NjKwMl/VJrAByEyOzU2sbVkk1OFys/MwK67+q9KgpkR1G+m5zcTay6dDmz/cd
	amO4AcM1xo6eQgCgMIlrDlqkBtuNuBPWnYhqyhpUyFLamx9FT5J8OAGl+3k1nvOn
	WReUSndtdEQlgFsRBNiKXAitgbFVmJWNeOEhPNu9Xfq488dDDy3zSWz8H658ejBs
	wVXpDxkHmsgfh3G7JUOxUwe281NGxBe38m7gG+8z1XtXXnUWKFPxP7QHb3Co+ZBp
	HRJN3gxt1x/5klvnZ6cg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32hc97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:16:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48270ee051dso1125922b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505404; cv=none;
        d=google.com; s=arc-20240605;
        b=Yr7Fi90QPRCXCwgo6NuOHELDCf5Wo3NVfXICy/ylPgHiMDWm2Ojqx8pol1zBizdITa
         B6LeQkvbfTKibV7gK7p9rdi6wN83gh8rmuqxuo0BEbI7XHB8XlKtRqh3ZVEixXPBdnCI
         /PJY9pGiD2jTzzAvDeVsyMkPjCL4JWDZcYmV93YfGoIRjRbRKxzIzrggeyBLKnK/PIbi
         M10QgLdjbqZltZr7JzlWFpdgTHKhq4Etm0HPe8gvLAmaksjhGvDnfK9ZtAx9ymsqDDkX
         l3nD7k8TUluO2cH29rYxwUxF9/5bnWDL5CiqCRSV1DcpcloGaO6nGOrUS8qgpyE/bCVm
         P5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jKC4fA5XoPXj0Nn3vhDjLseDL92E+p2MaLlggox48iM=;
        fh=LkX2LxOIiin55dADFM88P1J55A5PrDNSSTAuwSa5hcU=;
        b=hqR9PsHBtnf7u1g/IEH3IvWSlWgiTnUAW2GDb2mKGkT0zIlr2k+OtjCb/UKca+p3OF
         tBft9kyVgSIX7VBw3B59fDidA9NNb3mQVj6bSc0vaZfmHeIWvn/f+ft4KTjRvHl0OJHr
         rBiDsv29dN+Vg4uhdV2LT9/yqJx7ddPJ8cU0vO0T+j1vaVgU/CWA17kgH/X0CdX8Olce
         GZdZQ0UfxP3za9GEe92ilHwTwvqLHJVyJbGVxjDfHG7VtOq8HF1zE2RCh3NcJpBHfVt3
         O5RnfCaHz5BVV3NhEGVImp/HHlGHz9EuCD1B1KFlMtzbqRUkQYfHKQNKzzz0NKf/3wQF
         chHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778505404; x=1779110204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jKC4fA5XoPXj0Nn3vhDjLseDL92E+p2MaLlggox48iM=;
        b=OBVOIV9Tgm3u9dCfdJSUCANZU9uPyngvkUfi04Ou9TTAx99HmRtb+d1YiojTG2oXS2
         cTofjUEJUNP4kUbLrXW7hXKCOtVAemFFpgP/0wBS5xu1ldCp/rQEfvI/Q1Lq6jnXHnHW
         GUpzodjiPGgCgEvM+UMPnxXtfURi+KXG/9rQmiMWGPDkTlfbwkFmByGNAHSuxjsaYrMv
         aCQEDE9ucKl0tYajdR5h0pBbtOfNgXFnrIB4zC+a21Y1hlkFho+vfyylt7wtZ6dP8gXJ
         Gjvaweg/IIXMcNkfE7qsNNK0yzWbYOAGBGYdERvtV39gYlBueDwu9O1X9na9YpPGAcxd
         U80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505404; x=1779110204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKC4fA5XoPXj0Nn3vhDjLseDL92E+p2MaLlggox48iM=;
        b=cxB7PbOX3RQGkwikhRxwQINSRrJ5NhvJm6olA/qgTlPEiECnCSQb061t2WU0tiGsZC
         rw7C8DuCZ47nk+bteqdOjxiNIja5+CIL5AwaMvZmWHECv1/2lf1e2T49WmhW5OjOQVEU
         Vg3t29V4C3q9v5iBQlST0wjdlKsjAqwzjW3rMuJKgXRvi9jsRIjhpZCKbAf5SY6zd3KY
         5tFdcVCUBV5GIza/BXyQN93xGA04WUYdaqITnSAQ7vvA5dDHQcSFPOaah3Kri+kQr5VJ
         NLHvwLMDr9jpu6wV8exrYIKA5C+FsN6FOrghr/0zctJ929ByZEhvhZ95Mn2pyBiT+iRo
         ccng==
X-Forwarded-Encrypted: i=1; AFNElJ+YioRK7MefryZflqIsci+5fG9II18r2cHwEX/NA2t3Kk51EqPnnH9ONnE4cgTZmJF+SB3iy1TqHgyrY0+m@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQV6Ww+bKDjCvmW9cv1Ied9UDTOUSWQQKY6T+faL7w4+huxVS
	DQrhcIKkx2/Mo/K0GAx2kMNMhKcUQ8LZ4igOuKGStxdPIVtJvHpHEAUeCwFD3721nePiGz6MjJB
	plxjJgLA6be77Q3uErAXHm/R08diIwLHJhUUWp9WpxgGJ4Ft/tprpf/KxiIsSBN2mhhu826gart
	NUFaAd5Rq56BCD55/Q2I0ZR1GX5nBB5AvlWqDhvuYcGSM=
X-Gm-Gg: Acq92OHo1rh7qSrwHZ8YVK37oIPKbbUPSOz/0qH6+gN3LYAElcIJ3CTZiGDKck8ARNq
	e4u29nEcSBcmOJavMXgKkKQcEeRtnWpkxrSzdYf6HrATiAR6Yd+zhVEIEtif+prg/J9t0GOH6LH
	i2I9ZKp3ICeoV9UyJg8ZQGTX7OwGIB5aY+NUNEHEjOAjQ5a+kIguxnVSbEOygBrReZ8CCQWFgmD
	++zYLOuJv/DJJhfRwLS4K9csG6BNs2VoKXUuxfYJQmpzD7n
X-Received: by 2002:a05:6808:e687:b0:47b:d07b:ec9b with SMTP id 5614622812f47-4807fd390bamr6084786b6e.24.1778505404487;
        Mon, 11 May 2026 06:16:44 -0700 (PDT)
X-Received: by 2002:a05:6808:e687:b0:47b:d07b:ec9b with SMTP id
 5614622812f47-4807fd390bamr6084762b6e.24.1778505404037; Mon, 11 May 2026
 06:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508065722.18785-1-daniel@quora.org> <CACSVV02t99r2JpT9EUar_YRs+zgpzjNYgNvvB9BGLLnpssY4BA@mail.gmail.com>
 <20260511093325.74e2777f@fedora>
In-Reply-To: <20260511093325.74e2777f@fedora>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 11 May 2026 06:16:32 -0700
X-Gm-Features: AVHnY4IbPRfjB1vCZdM9dUhiig08nkqLlXFw3g9vD9Ab24nv_S0ALmZZEdT1ptc
Message-ID: <CACSVV03ZMuVEK6OegD8YKg4RwHWTU_CbWcwdWKSeyiaU=yV1Fg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix shrinker deadlock
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel J Blueman <daniel@quora.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZTK9OoA99M6hNfyl-VMoAUjQoAt5aGdx
X-Proofpoint-GUID: ZTK9OoA99M6hNfyl-VMoAUjQoAt5aGdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NSBTYWx0ZWRfX7hKTYeSSbsmw
 vIYKWvhgdQRvPIXDBPShxL2N3jM+102ycNzLuEf5Aj0XnIJa5p0CUHj8fXP3tv1mi2KNXntq77q
 wyLfJQUukl9T8zmVvqcpMIZfH6vOq25QeMSlUJpOGuoRiMzGotOpo3ouiFySnu8MhtPjELseUJF
 kzoUESh5UW2ASm+fxR/f3j4FBz0JR3wr9/MzrTUGL6HniimgS+2KSG8lq/2ipL8HFHqLAmNu7y3
 f6pu3hJFxcv4JdeUSruse+Ta8FiCBsjWXYBovKvbItEzuvTLgOxVSCA51qjMAdxIhDeMWlbI0PN
 i0hpmN3lerf43Auip4muBTGDRLPRpt3CfAxCiv86lAKvK6KkSFYoneTxS9T/IOhvm489GgymMgE
 ot0xYkXDijQG92EAILk6grIkVhL5oUs/k26JgWF+HZjdc/xaQOmKQGTCFRtSDMrFKvclQObUQOC
 cUIg2Nypae8r5Dz1Dvg==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01d6bd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=t9ty7G3lAAAA:8 a=5lCBbuLfmW-9pqWJmD8A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110145
X-Rspamd-Queue-Id: 0F78850EBD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106944-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[quora.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid,quora.org:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:37=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi,
>
> On Sat, 9 May 2026 08:34:15 -0700
> Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> > On Thu, May 7, 2026 at 11:57=E2=80=AFPM Daniel J Blueman <daniel@quora.=
org> wrote:
> > >
> > > With PROVE_LOCKING on an Snapdragon X1 and VM reclaim pressure, we se=
e:
> > >
> > > """
> > > kswapd0/121 is trying to acquire lock:
> > > ffff800080ed3800 (reservation_ww_class_acquire){+.+.}-{0:0}, at:
> > >   msm_gem_shrinker_scan (drivers/gpu/drm/msm/msm_gem_shrinker.c:189)
> > >
> > > but task is already holding lock:
> > > ffffbf4ddb44ca40 (fs_reclaim){+.+.}-{0:0}, at:
> > >   balance_pgdat (mm/vmscan.c:7236 (discriminator 2))
> > >
> > > which lock already depends on the new lock.
> > >
> > > the existing dependency chain (in reverse order) is:
> > >
> > > -> #2 (fs_reclaim){+.+.}-{0:0}:
> > > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:=
5825)
> > > fs_reclaim_acquire (mm/page_alloc.c:4325 mm/page_alloc.c:4339)
> > > dma_resv_lockdep (drivers/dma-buf/dma-resv.c:798)
> > > do_one_initcall (init/main.c:1392)
> > > kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:=
1470
> > >   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:17=
03
> > >   (discriminator 1))
> > > kernel_init (init/main.c:1593)
> > > ret_from_fork (arch/arm64/kernel/entry.S:858)
> > >
> > > -> #1 (reservation_ww_class_mutex){+.+.}-{4:4}:
> > > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:=
5825)
> > > dma_resv_lockdep (./include/linux/ww_mutex.h:164 (discriminator 1)
> > >   drivers/dma-buf/dma-resv.c:791 (discriminator 1))
> > > do_one_initcall (init/main.c:1392)
> > > kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:=
1470
> > >   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:17=
03
> > >   (discriminator 1))
> > > kernel_init (init/main.c:1593)
> > > ret_from_fork (arch/arm64/kernel/entry.S:858)
> > >
> > > -> #0 (reservation_ww_class_acquire){+.+.}-{0:0}:
> > > check_prev_add (kernel/locking/lockdep.c:3165)
> > > __lock_acquire (kernel/locking/lockdep.c:3284
> > >   kernel/locking/lockdep.c:3908 kernel/locking/lockdep.c:5237)
> > > lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:=
5825)
> > > drm_gem_lru_scan (./include/linux/ww_mutex.h:163 (discriminator 1)
> > >   drivers/gpu/drm/drm_gem.c:1681 (discriminator 1))
> >
> > Your line #s don't quite match mine, but AFAICT this is from the
> > ww_acquire_init()
> >
> > What I'm unsure about is if this could cause live-lock against another
> > operation which requires obtaining both obj and vm locks in a
> > potentially different order (which would also be using a
> > ww_acquire_ctx ticket to backoff in case of conflicting locking
> > order).  It wouldn't deadlock because we don't sleep forever if we do
> > sleep, but...
> >
> > Possibly we should also be using trylock to also acquire the vm lock,
> > but lockdep would still complain as it doesn't know the ticket will be
> > only used w/ trylock (unless we did something hacky by using a
> > different ww_class?)
>
> FWIW, we started using a ticket in the initial version of the Panthor
> shrinker, and ditched it at some point because of these unsolvable lock
> ordering issues. It also seems to me that trylock-all-the-way is the
> right solution, and if we trylock and back off + immediately move to
> the next BO if any lock is already held, the ticket approach is not as
> useful, because we're not going to use the retry mechanism provided by
> ww_mutex anyway.
>
> It's true that it does the bookkeeping, which simplifies the rollback
> procedure, but if you look at the other locks taken in the shrinker
> path, they are static (one per-component involved in reclaim) for most
> of them, meaning the rollback is pretty straightforward. The only
> exception is the VM lock (one per vm_bo in case of shared BOs). In
> panthor, we just decided to open-code this rollback logic (see
> panthor_gem_try_evict_no_resv_wait() [1]) instead of teaching ww_mutex
> about non-blocking locks when a ticket is provided. Not saying this is
> the best option, but it works...

hmm, ok.. and if we block waiting for BO that is before grabbing the
vm locks so no live-lock concern (sry, been a while since I've looked
at this)..  So I guess trylock is maybe the better approach.  In this
case we should drop the ticket arg (basically revert commit
02070f049875 ("drm/gem: Add ww_acquire_ctx support to
drm_gem_lru_scan()"))

BR,
-R

> Regards,
>
> Boris
>
> [1]https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/dr=
ivers/gpu/drm/panthor/panthor_gem.c?ref_type=3Dheads#L1425

