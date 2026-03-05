Return-Path: <linux-arm-msm+bounces-95691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNcVMVT0qWljIgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 22:23:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D92187A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 22:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE4DF3027DB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 21:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D64C35DA47;
	Thu,  5 Mar 2026 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="C31/tfLP";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="mu2V0k+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7DB35DA44;
	Thu,  5 Mar 2026 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745808; cv=pass; b=LXVXzkvBtPWP5wLxLBFmh19mnPtGcGvpdcjrritv1S/+6ihX6uA6HlOMlLYvqfbPkx/bPJTxEy3nTo/ULDIzvx0Ut8IE9fjAvQLnaa7OGE2ZFnX8AKfpPMtbh/9Y3v3OnvTlKp7x6pBHJmdKpi0Is7SrRDYhctso39QaurSnRps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745808; c=relaxed/simple;
	bh=OZP5lWgG+QkGUyGLKi36oh/e9adNrWgDq8+JTbG/G3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tp+BP/V4Ay9nd7FjvIcDntfOdz14WZfiTjTZF55G3w+llRXC8dVbmQleOdCnsAoCGK+2ZnG4du+MdEyvbQorjgmkKQCivPblNsH2AqkZ+l1PD6wWtdpSbaeQWGsFyOLhibZVXALuPCH5RTxebc/F/cnLZyq30kb8s+ne5t+tClo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=C31/tfLP; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=mu2V0k+u; arc=pass smtp.client-ip=85.215.255.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1772745443; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FC9CoXLFawc/yl7zP9sJOqYxsIfZ49BUrjvlBTG9CoS4PdwsFEBubQ8qMM1k5HFmkR
    mhNP2MIpT8HbNSiG+btMUuleajt+xW7j88PQyC5xIWe/hoRNAFs4V/gcL3dAHcfjS1PO
    GFMYSt4+OmLYy6M4KLTOqJhdJgVNanOw0Evsl1WcChHH2XsQyA1NhLhp9lp7N7mfKMVq
    1kYYAgtdLu1F0Z4ceXuWkCRu4lFBGqfF0cur6eK2S39zEG90IzTWM6iWFOB8cXdZQJoe
    Exts40TzMr9P/7bJAgoOETRZctLOWJ+u7pJMw18KyiEvb/dW0eiQ8gkPKG1eMDcuNwNZ
    PhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772745443;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=OZP5lWgG+QkGUyGLKi36oh/e9adNrWgDq8+JTbG/G3Y=;
    b=kKLhXlrRAD+JZLCH+CiasGjcBDhEloYs7jRrJGgJhi0gL0q0Q+Fw04A3UkKBQSiMyG
    L4fKB4fZ0AwGg9RvOAIOhCTFjmS5Io97TG/k0+GsR/8Ze+1aQwq4NixDYyzTPSrC3wtf
    s9h+upUM9SFMxlQeXXP6dHlQx+exzMDkENsV8Jb1njyAG8fKHLZf2TlAQnextZrRGxk0
    +ZOEWE+FL2W4MhoxOEdldc+GY56IW4BNgWrvEfTA6oY70dWymRqbHP7z78yAbNL5s7yJ
    6flZ0sndHHQmvuSWr40jHANlGCDZ5m8KjSD16Zb9P/0dWHRL4koxjqCNaNoOS86RB96w
    NpJA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772745443;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=OZP5lWgG+QkGUyGLKi36oh/e9adNrWgDq8+JTbG/G3Y=;
    b=C31/tfLPlYWm5hI/gCHOTnRO8HZcSFO4BepUkFDi8RBhh030Nkk9vawf598ZSbD20T
    SQNvMcEtaKeqSBzZvWBBNHXTsVIjJZgP9lB4lO6dC73YLpJUQXPRmmtBzp5+SFtl3IoZ
    vj02nZYo5Sq+MlUGuLxNq/FSA99dp+AMkeuGhWvw99FNDUW5ji2kyeyV9mb3duY961Ul
    rrPJTWoojWmDv2pBz4FzbSF1ldg7271Yrc6KtxJ0ChVBbWJHKJZWmSSdCLz6qunrQEQw
    JKbKs0lhCX9Ky4XO63ccqAVWuWvBPwV/lWB+MCIoSPLJtaVtigCPxZDRoz0Ped2Er4mw
    M8DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772745443;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=OZP5lWgG+QkGUyGLKi36oh/e9adNrWgDq8+JTbG/G3Y=;
    b=mu2V0k+uU7OiQtevUd/s+JsuyOQBp6cfQoqwZNqBXCWqXEyunj1aYSfPuY2O2S24Io
    925WG5htf/d5CZmj8kCQ==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGSTpN/lG4EkH1OcwzJ11G3m+XGf4kwpD3TrkAw="
Received: from p200300c58703fb9bfc647aebea4a424d.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z79345225LHN7Na
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Mar 2026 22:17:23 +0100 (CET)
Message-ID: <ce70f471d5c6bfd3c6ffcffe9c34a823e7b557b9.camel@iokpp.de>
Subject: Re: [PATCH v2 08/11] scsi: ufs: ufs-qcom: Implement vops
 tx_eqtr_notify()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "open
 list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 05 Mar 2026 22:17:22 +0100
In-Reply-To: <20260304135313.413688-9-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
	 <20260304135313.413688-9-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 431D92187A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95691-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iokpp.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iokpp.de:dkim,iokpp.de:mid]
X-Rspamd-Action: no action

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDA1OjUzIC0wODAwLCBDYW4gR3VvIHdyb3RlOgo+IGZyZXEp
Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBtaW5fdCh1MzIsIGdlYXIsIGhiYS0+bWF4X3B3cl9p
bmZvLmluZm8uZ2Vhcl9yeCk7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIGludCB1ZnNfcWNvbV9jaGFu
Z2VfcG93ZXJfbW9kZShzdHJ1Y3QgdWZzX2hiYSAqaGJhLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IHVmc19wYV9sYXllcl9hdHRyICpwd3JfbW9kZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0g
dWZzaGNkX3BtY19wb2xpY3kgcG1jX3BvbGljeSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGludCBy
ZXQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHVmc19xY29tX3B3cl9jaGFuZ2Vfbm90aWZ5
KGhiYSwgUFJFX0NIQU5HRSwgcHdyX21vZGUpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihoYmEtPmRldiwgIlBvd2Vy
IGNoYW5nZSBub3RpZnkgKFBSRV9DSEFOR0UpIGZhaWxlZDoKPiAlZFxuIiwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiAr
wqDCoMKgwqDCoMKgwqByZXQgPSB1ZnNoY2RfY2hhbmdlX3Bvd2VyX21vZGUoaGJhLCBwd3JfbW9k
ZSwgcG1jX3BvbGljeSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgdWZzX3Fj
b21fcHdyX2NoYW5nZV9ub3RpZnkoaGJhLCBQT1NUX0NIQU5HRSwgcHdyX21vZGUpOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICt9CgpzZWVtcyBRY29tIFVGUyBkcml2ZXIgZG9l
cyBkdXBsaWNhdGUgbm90aWZ5IG5vdywgYWJvdmUKdWZzX3Fjb21fY2hhbmdlX3Bvd2VyX21vZGUo
KSBkb2VzIFBSRS9QT1NUIGl0c2VsZiwgdGhlbiBjYWxscyBjb3JlCnVmc2hjZF9jaGFuZ2VfcG93
ZXJfbW9kZSgpIHdoaWNoIGFscmVhZHkgZG9lcyBQUkUvUE9TVCwgZG91YmxlIHNpZGUgZWZmZWN0
cz8gb3IKSSBhbSB3cm9uZz8KCktpbmQgcmVnYXJkcywgCkJlYW4KCg==


