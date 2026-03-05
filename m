Return-Path: <linux-arm-msm+bounces-95690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M4jHV/xqWlGIQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 22:10:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C82186C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 22:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48CF03007AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 21:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E77434FF47;
	Thu,  5 Mar 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="epPf6aRM";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="QEnaNmvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429101448E0;
	Thu,  5 Mar 2026 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772744974; cv=pass; b=p/+lJS0WcVoHriFS8N71n0VDO8vFEiIGkrW9JXqD0McyyDvc/C2dteT72T/wVucm9J7CtFMQLG1smKwd4Ro0ySUKm18a7yRyg/06iJpJYFbeEw3iYLu+SzbCMaVswyNU3iBrkqIMMGiuu4uaBtSOx2RdbWJdCZmF7Y+w74S5xkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772744974; c=relaxed/simple;
	bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AjvJmwhgbJPbidZphLQXG3+lEVmc9CFa9fVb8jd6PjaC2gmbLAzjMbzbtGlwexdF908suukt+peOCzWn+VGtjXDB1S07zFafkc418qrO9VuyRbCMyPqiDFxWEovTtXukZgpO9fc7nuj4FLPvWCXplrxgyLoQqR8dc9Cw349Z8TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=epPf6aRM; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=QEnaNmvE; arc=pass smtp.client-ip=85.215.255.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1772744598; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XLB+plORjjwdonK5xvMsENRrqBB53SzB5cMQHIBO7lEjFuTDaSHxmIWdtg+Ao1Obh4
    iKZJNBprdYEAIZTT0tfSu96/m5PY8zPsm3hErv44Rf3LFnNWQGsrGHy5Q2FboNlgk9Kf
    Wp/xOw/PwL9BDVqqoQF7sQgk5kP4Iw+8nrB6hx08P3Car1P3W7jqssJw0ia276FKHvLr
    6/1jO1qrGUjQz3DwZ0CLMF0mmKhZINqdUmtkGCBnc6FSNVqqMb4K93S03+vcdinmxmvA
    oK2ZQQ570YZmSk3+hT4B5j0alYggMH0ThrVNu0sc9cqoA1mPnq4I9iJkDCEclsL780AM
    F13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=p6aD7dW21DxwngeXqNWYWK8OdEa6zPFWiAqhJWMuaM8GtElpPyECJRed5Lxm3nnoun
    oWDhbr9UZb1FYCnYg3UpWJGd4QLN0EJuDlELwIQszR4lIMHQWiXhgcQQu+ZsUPaiPvF1
    IMoQnRwa4UvtkcFxCHpfcjX14MXdvYZ6HUhIYcR5Lyk+ry0zRLlMkuWC/UKFikl5sQ3q
    +TOvBVtW0Ohor5aRYyRWUPKewm5Fhz3NTSnZyDNDxa5rPZOPdPh3DlYBdfiq0Wm+ScL1
    PTPWl+ewLIc213d6O1DeJgH3OO4n9oLdvSA0/4HyXT3yV1MCGf5VYphsdYQ/yPeL5o0Z
    R1rA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=epPf6aRM0co0gjVfIz63J+hgTBgdg76E+9k0wrJqzS/2hoKpLyaxjd59UVifC0w3S2
    gVkIPfSjdDYlvQ35H4bgbnun+Y0woiNlwQe1H4u8nJK+S4BmU2ipTrAD9NiFc9W5xXkv
    9yzmjT6TDXrBGqlEebr0A84R4+puSyl/V4C8BmhFrxz/d1CiY5IoNYiITmZ8WjtGJZRk
    Bl5+R+IOlQDGiq3PJTeJgFF75pQDtFUHVDb6DbHe7aw5L4saI+q5XAcq48U8Wbq7Rq1J
    IJBo/mopmtDl/sYlTp3rttgcTXfR2siU7Idj3mEtEEq7h8OEx/fRxPXZkrFD/rhH+AwO
    nzQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772744598;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Yx4pFGq+U2fz4UG6x4F5rdwJg0eTjQaePUmLPxRD42g=;
    b=QEnaNmvEE1Gz2soV99MDcdGfrKTxP4eGMNq1bUdwgstKdqcJWgGHKB5lQ4SBEqXrBR
    rajzeivLC4sZqqBg8LBw==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGSTpN/lG4EkH1OcwzJ11G3m+XGf4kwpD3TrkAw="
Received: from p200300c58703fb9bfc647aebea4a424d.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z79345225L3G7LL
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Mar 2026 22:03:16 +0100 (CET)
Message-ID: <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Sai Krishna
 Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>,
 Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang
 <zhang.lyra@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  "Bao
 D. Nguyen" <quic_nguyenb@quicinc.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Archana Patni <archana.patni@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "open list:UNIVERSAL FLASH STORAGE
 HOST CONTROLLER DRIVER..." <linux-samsung-soc@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:UNIVERSAL FLASH
 STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
Date: Thu, 05 Mar 2026 22:03:16 +0100
In-Reply-To: <20260304135313.413688-2-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
	 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D22C82186C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[iokpp.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iokpp.de:dkim,iokpp.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDA1OjUzIC0wODAwLCBDYW4gR3VvIHdyb3RlOgo+IEBAIC00
NzQ3LDYgKzQ3NDUsMjIgQEAgc3RhdGljIGludCB1ZnNoY2RfY2hhbmdlX3Bvd2VyX21vZGUoc3Ry
dWN0IHVmc19oYmEKPiAqaGJhLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgfQo+
IMKgCj4gK2ludCB1ZnNoY2RfY2hhbmdlX3Bvd2VyX21vZGUoc3RydWN0IHVmc19oYmEgKmhiYSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCB1ZnNfcGFfbGF5ZXJfYXR0ciAqcHdyX21vZGUpCj4gK3sKPiArwqDCoMKgwqDCoMKg
wqBpbnQgcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqB1ZnNoY2Rfdm9wc19wd3JfY2hhbmdlX25v
dGlmeShoYmEsIFBSRV9DSEFOR0UsIHB3cl9tb2RlKTsKCgp1ZnNoY2RfY2hhbmdlX3Bvd2VyX21v
ZGUoKSBjYWxscyBwd3JfY2hhbmdlX25vdGlmeShQUkVfQ0hBTkdFKSBidXQgaWdub3JlcyBpdHMK
cmV0dXJuLCB0aGlzIGNhbiBjb250aW51ZSB3aXRoIGludmFsaWQgdmVuZG9yIHByZXA/IEkgc2F3
IHRoZXJlIGlzIGNoZWNrdXAKYmVmb3JlLCBkbyB5b3UgdGhpbmsgYWRkaW5nIGNoZWNrIHJlc3Vs
dD8KCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHVmc2hjZF9kbWVfY2hhbmdlX3Bvd2VyX21v
ZGUoaGJhLCBwd3JfbW9kZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICghcmV0KQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1ZnNoY2Rfdm9wc19wd3JfY2hhbmdlX25vdGlmeSho
YmEsIFBPU1RfQ0hBTkdFLCBwd3JfbW9kZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwodWZzaGNkX2NoYW5nZV9wb3dlcl9tb2RlKTsK
CgpLaW5kIHJlZ2FyZHMsCkJlYW4K


