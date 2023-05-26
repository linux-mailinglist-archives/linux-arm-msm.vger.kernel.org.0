Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABF77126CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 14:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243316AbjEZMiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 08:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243206AbjEZMiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 08:38:13 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FDA1A7;
        Fri, 26 May 2023 05:38:10 -0700 (PDT)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7ADF521B6D;
        Fri, 26 May 2023 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685104689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NlSTzOdBCsn8bBEm28/QiTDf9pBdVtRWeixiw+8AaIA=;
        b=vKfE+XU28x9I9IM6A8zbFy8oicwZdtlCBlXHoequIzqreJy0UVebjVEepqAvZyG9D9NZTC
        /embTr0iIZvrmU0UOU9KvMs2nVMK5OEWocgEg0u8qk2hs1hBPiqEnAukk6P7MyrC4Ha96G
        2jh0hVdtc86aaYZpQamLyxw4SWStsVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685104689;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NlSTzOdBCsn8bBEm28/QiTDf9pBdVtRWeixiw+8AaIA=;
        b=6bMSN1o1e07f20IOQm3p+sPnPc0Xfp2GijaqnPunqr5PhhQ5fFaGu5ZCvOBc1xU5reRNAA
        x5tlJZuPM2KcRHCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0D719134AB;
        Fri, 26 May 2023 12:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id gWdqAjGocGSLWgAAGKfGzw
        (envelope-from <tzimmermann@suse.de>); Fri, 26 May 2023 12:38:09 +0000
Message-ID: <98ec3f40-1cd5-b40a-9fe7-e49f9d840f65@suse.de>
Date:   Fri, 26 May 2023 14:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v4,02/13] fbdev: Add initializer macros for struct fb_ops
To:     Sui Jingfeng <15330273260@189.cn>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230524092150.11776-3-tzimmermann@suse.de>
 <07e6077f-8a5c-54b9-29d0-57f1bc868fef@189.cn>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <07e6077f-8a5c-54b9-29d0-57f1bc868fef@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------20wMLQhe0Aqedz8dg0QP2IqP"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------20wMLQhe0Aqedz8dg0QP2IqP
Content-Type: multipart/mixed; boundary="------------JzQBkA0hNnYhRHarsViFp0zK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, daniel@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com,
 sam@ravnborg.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <98ec3f40-1cd5-b40a-9fe7-e49f9d840f65@suse.de>
Subject: Re: [v4,02/13] fbdev: Add initializer macros for struct fb_ops
References: <20230524092150.11776-3-tzimmermann@suse.de>
 <07e6077f-8a5c-54b9-29d0-57f1bc868fef@189.cn>
In-Reply-To: <07e6077f-8a5c-54b9-29d0-57f1bc868fef@189.cn>

--------------JzQBkA0hNnYhRHarsViFp0zK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDUuMjMgdW0gMjI6NTcgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IHdlIGxvdmUgeW91ciBwYXRjaDoNCj4gDQo+IA0KPiBPbiAyMDIzLzUv
MjQgMTc6MjEsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gRm9yIGZyYW1lYnVmZmVy
cyBpbiBJL08gYW5kIHN5c3RlbSBtZW1vcnksIGFkZCBtYWNyb3MgdGhhdCBzZXQNCj4+IHN0
cnVjdCBmYl9vcHMgdG8gdGhlIHJlc3BlY3RpdmUgY2FsbGJhY2sgZnVuY3Rpb25zLg0KPj4N
Cj4+IEZvciBkZWZlcnJlZCBJL08sIGFkZCBtYWNyb3MgdGhhdCBnZW5lcmF0ZSBjYWxsYmFj
ayBmdW5jdGlvbnMgd2l0aA0KPj4gZGFtYWdlIGhhbmRsaW5nLiBBZGQgaW5pdGlhbGl6ZXIg
bWFjcm9zIHRoYXQgc2V0IHN0cnVjdCBmYl9vcHMgdG8NCj4+IHRoZSBnZW5lcmF0ZWQgY2Fs
bGJhY2tzLg0KPj4NCj4+IFRoZXNlIG1hY3JvcyBjYW4gcmVtb3ZlIGEgbG90IGJvaWxlcnBs
YXRlIGNvZGUgZnJvbSBmYmRldiBkcml2ZXJzLg0KPj4gVGhlIGRyaXZlcnMgYXJlIHN1cHBv
c2VkIHRvIHVzZSB0aGUgbWFjcm8gdGhhdCBpcyByZXF1aXJlZCBmb3IgaXRzDQo+PiBmcmFt
ZWJ1ZmZlci4gRWFjaCBtYWNybyBpcyBzcGxpdCBpbnRvIHNtYWxsZXIgaGVscGVycywgc28g
dGhhdA0KPj4gZHJpdmVycyB3aXRoIG5vbi1zdGFuZGFyZCBjYWxsYmFja3MgY2FuIHBpY2sg
YW5kIGN1c3RvbWl6ZSBjYWxsYmFja3MNCj4+IGFzIG5lZWRlZC4gVGhlcmUgYXJlIGluZGl2
aWR1YWwgaGVscGVyIG1hY3JvcyBmb3IgcmVhZC93cml0ZSwgbW1hcA0KPj4gYW5kIGRyYXdp
bmcuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+IMKgIGluY2x1ZGUvbGludXgvZmIuaCB8IDExMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4+IGluZGV4IDJjZjhl
ZmNiOWUzMi4uNzMxNDcyYTJiYjYyIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51eC9m
Yi5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4+IEBAIC01MzgsOSArNTM4LDMx
IEBAIGV4dGVybiBzc2l6ZV90IGZiX2lvX3JlYWQoc3RydWN0IGZiX2luZm8gKmluZm8sIA0K
Pj4gY2hhciBfX3VzZXIgKmJ1ZiwNCj4+IMKgIGV4dGVybiBzc2l6ZV90IGZiX2lvX3dyaXRl
KHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciANCj4+ICpidWYsDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgY291bnQsIGxvZmZf
dCAqcHBvcyk7DQo+PiArLyoNCj4+ICsgKiBJbml0aWFsaXplcyBzdHJ1Y3QgZmJfb3BzIGZv
ciBmcmFtZWJ1ZmZlcnMgaW4gSS9PIG1lbW9yeS4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjZGVm
aW5lIF9fRkJfREVGQVVMVF9JT19PUFNfUkRXUiBcDQo+PiArwqDCoMKgIC5mYl9yZWFkwqDC
oMKgID0gZmJfaW9fcmVhZCwgXA0KPj4gK8KgwqDCoCAuZmJfd3JpdGXCoMKgwqAgPSBmYl9p
b193cml0ZQ0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxUX0lPX09QU19EUkFXIFwN
Cj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfZmlsbHJlY3TCoMKgwqAgPSBjZmJfZmlsbHJlY3Qs
IFwNCj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfY29weWFyZWHCoMKgwqAgPSBjZmJfY29weWFy
ZWEsIFwNCj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfaW1hZ2VibGl0wqDCoMKgID0gY2ZiX2lt
YWdlYmxpdA0KPiANCj4gSGVyZSzCoCBpdCBzZWVtcyB0aGF0IHlvdXIgdGV4dCBlZGl0b3Ig
cmVwbGFjZSB0aGUgdGFwIHdpdGggc3BhY2UsIGJ1dCANCj4gSSdtIE9LLg0KPiANCj4gSSdt
IGFza2luZyBiZWNhdXNlIEkgc2VlIG90aGVyIF9fRkJfX0RFRkFVTFRfKiBtYWNybyBiZWdp
biB3aXRoIHRhYnMuDQoNClllYWgsIHRoZXNlIGFyZSBtaXN0YWtlcy4gSSdsbCBmaXggdGhh
dCB3aXRoIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+PiArI2RlZmluZSBfX0ZCX0RFRkFVTFRfSU9fT1BTX01NQVAgXA0KPj4gK8KgwqDCoCAu
ZmJfbW1hcMKgwqDCoCA9IE5VTEwgLy8gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbg0KPj4gKw0K
Pj4gKyNkZWZpbmUgRkJfREVGQVVMVF9JT19PUFMgXA0KPj4gK8KgwqDCoCBfX0ZCX0RFRkFV
TFRfSU9fT1BTX1JEV1IsIFwNCj4+ICvCoMKgwqAgX19GQl9ERUZBVUxUX0lPX09QU19EUkFX
LCBcDQo+PiArwqDCoMKgIF9fRkJfREVGQVVMVF9JT19PUFNfTU1BUA0KPj4gKw0KPj4gwqAg
LyoNCj4+IMKgwqAgKiBEcmF3aW5nIG9wZXJhdGlvbnMgd2hlcmUgZnJhbWVidWZmZXIgaXMg
aW4gc3lzdGVtIFJBTQ0KPj4gwqDCoCAqLw0KPj4gKw0KPj4gwqAgZXh0ZXJuIHZvaWQgc3lz
X2ZpbGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBzdHJ1Y3QgDQo+PiBmYl9m
aWxscmVjdCAqcmVjdCk7DQo+PiDCoCBleHRlcm4gdm9pZCBzeXNfY29weWFyZWEoc3RydWN0
IGZiX2luZm8gKmluZm8sIGNvbnN0IHN0cnVjdCANCj4+IGZiX2NvcHlhcmVhICphcmVhKTsN
Cj4+IMKgIGV4dGVybiB2b2lkIHN5c19pbWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNvbnN0IHN0cnVjdCANCj4+IGZiX2ltYWdlICppbWFnZSk7DQo+PiBAQCAtNTQ5LDYgKzU3
MSwyNyBAQCBleHRlcm4gc3NpemVfdCBmYl9zeXNfcmVhZChzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywgDQo+PiBjaGFyIF9fdXNlciAqYnVmLA0KPj4gwqAgZXh0ZXJuIHNzaXplX3QgZmJfc3lz
X3dyaXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciANCj4+ICpi
dWYsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdCBjb3Vu
dCwgbG9mZl90ICpwcG9zKTsNCj4+ICsvKg0KPj4gKyAqIEluaXRpYWxpemVzIHN0cnVjdCBm
Yl9vcHMgZm9yIGZyYW1lYnVmZmVycyBpbiBzeXN0ZW0gbWVtb3J5Lg0KPj4gKyAqLw0KPj4g
Kw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxUX1NZU19PUFNfUkRXUiBcDQo+PiArwqDCoMKg
IC5mYl9yZWFkwqDCoMKgID0gZmJfc3lzX3JlYWQsIFwNCj4+ICvCoMKgwqAgLmZiX3dyaXRl
wqDCoMKgID0gZmJfc3lzX3dyaXRlDQo+PiArDQo+PiArI2RlZmluZSBfX0ZCX0RFRkFVTFRf
U1lTX09QU19EUkFXIFwNCj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfZmlsbHJlY3TCoMKgwqAg
PSBzeXNfZmlsbHJlY3QsIFwNCj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfY29weWFyZWHCoMKg
wqAgPSBzeXNfY29weWFyZWEsIFwNCj4+ICvCoMKgwqDCoMKgwqDCoCAuZmJfaW1hZ2VibGl0
wqDCoMKgID0gc3lzX2ltYWdlYmxpdA0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxU
X1NZU19PUFNfTU1BUCBcDQo+PiArwqDCoMKgIC5mYl9tbWFwwqDCoMKgID0gTlVMTCAvLyBk
ZWZhdWx0IGltcGxlbWVudGF0aW9uDQo+PiArDQo+PiArI2RlZmluZSBGQl9ERUZBVUxUX1NZ
U19PUFMgXA0KPj4gK8KgwqDCoCBfX0ZCX0RFRkFVTFRfU1lTX09QU19SRFdSLCBcDQo+PiAr
wqDCoMKgIF9fRkJfREVGQVVMVF9TWVNfT1BTX0RSQVcsIFwNCj4+ICvCoMKgwqAgX19GQl9E
RUZBVUxUX1NZU19PUFNfTU1BUA0KPj4gKw0KPj4gwqAgLyogZHJpdmVycy92aWRlby9mYm1l
bS5jICovDQo+PiDCoCBleHRlcm4gaW50IHJlZ2lzdGVyX2ZyYW1lYnVmZmVyKHN0cnVjdCBm
Yl9pbmZvICpmYl9pbmZvKTsNCj4+IMKgIGV4dGVybiB2b2lkIHVucmVnaXN0ZXJfZnJhbWVi
dWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPj4gQEAgLTYwNCw2ICs2NDcsNzUg
QEAgZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3QgZmJfaW5mbyAN
Cj4+ICppbmZvKTsNCj4+IMKgIGV4dGVybiBpbnQgZmJfZGVmZXJyZWRfaW9fZnN5bmMoc3Ry
dWN0IGZpbGUgKmZpbGUsIGxvZmZfdCBzdGFydCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbG9mZl90IGVuZCwgaW50IGRhdGFzeW5jKTsNCj4+ICsvKg0KPj4g
KyAqIEdlbmVyYXRlIGNhbGxiYWNrcyBmb3IgZGVmZXJyZWQgSS9PDQo+PiArICovDQo+PiAr
DQo+PiArI2RlZmluZSBfX0ZCX0dFTl9ERUZBVUxUX0RFRkVSUkVEX09QU19SRFdSKF9fcHJl
Zml4LCBfX2RhbWFnZV9yYW5nZSwgDQo+PiBfX21vZGUpIFwNCj4+ICvCoMKgwqAgc3RhdGlj
IHNzaXplX3QgX19wcmVmaXggIyMgX2RlZmlvX3JlYWQoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNoYXIgDQo+PiBfX3VzZXIgKmJ1ZiwgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBw
b3MpIFwNCj4+ICvCoMKgwqAgeyBcDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZiXyAj
IyBfX21vZGUgIyMgX3JlYWQoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7IFwNCj4+ICvCoMKg
wqAgfSBcDQo+PiArwqDCoMKgIHN0YXRpYyBzc2l6ZV90IF9fcHJlZml4ICMjIF9kZWZpb193
cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgDQo+PiBjb25zdCBjaGFyIF9fdXNlciAqYnVm
LCBcDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykgXA0KPj4gK8KgwqDCoCB7IFwNCj4+ICvC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG9mZnNldCA9ICpwcG9zOyBcDQo+PiArwqDC
oMKgwqDCoMKgwqAgc3NpemVfdCByZXQgPSBmYl8gIyMgX19tb2RlICMjIF93cml0ZShpbmZv
LCBidWYsIGNvdW50LCBwcG9zKTsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgPiAw
KSBcDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2RhbWFnZV9yYW5nZShpbmZvLCBv
ZmZzZXQsIHJldCk7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0OyBcDQo+PiAr
wqDCoMKgIH0NCj4+ICsNCj4+ICsjZGVmaW5lIF9fRkJfR0VOX0RFRkFVTFRfREVGRVJSRURf
T1BTX0RSQVcoX19wcmVmaXgsIF9fZGFtYWdlX2FyZWEsIA0KPj4gX19tb2RlKSBcDQo+PiAr
wqDCoMKgIHN0YXRpYyB2b2lkIF9fcHJlZml4ICMjIF9kZWZpb19maWxscmVjdChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGZiX2ZpbGxyZWN0ICpyZWN0KSBcDQo+PiAr
wqDCoMKgIHsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIF9fbW9kZSAjIyBfZmlsbHJlY3QoaW5m
bywgcmVjdCk7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoCBfX2RhbWFnZV9hcmVhKGluZm8sIHJl
Y3QtPmR4LCByZWN0LT5keSwgcmVjdC0+d2lkdGgsIA0KPj4gcmVjdC0+aGVpZ2h0KTsgXA0K
Pj4gK8KgwqDCoCB9IFwNCj4+ICvCoMKgwqAgc3RhdGljIHZvaWQgX19wcmVmaXggIyMgX2Rl
ZmlvX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLCBcDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZmJfY29w
eWFyZWEgKmFyZWEpIFwNCj4+ICvCoMKgwqAgeyBcDQo+PiArwqDCoMKgwqDCoMKgwqAgX19t
b2RlICMjIF9jb3B5YXJlYShpbmZvLCBhcmVhKTsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIF9f
ZGFtYWdlX2FyZWEoaW5mbywgYXJlYS0+ZHgsIGFyZWEtPmR5LCBhcmVhLT53aWR0aCwgDQo+
PiBhcmVhLT5oZWlnaHQpOyBcDQo+PiArwqDCoMKgIH0gXA0KPj4gK8KgwqDCoCBzdGF0aWMg
dm9pZCBfX3ByZWZpeCAjIyBfZGVmaW9faW1hZ2VibGl0KHN0cnVjdCBmYl9pbmZvICppbmZv
LCBcDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCBmYl9pbWFnZSAqaW1hZ2UpIFwNCj4+ICvCoMKgwqAgeyBcDQo+
PiArwqDCoMKgwqDCoMKgwqAgX19tb2RlICMjIF9pbWFnZWJsaXQoaW5mbywgaW1hZ2UpOyBc
DQo+PiArwqDCoMKgwqDCoMKgwqAgX19kYW1hZ2VfYXJlYShpbmZvLCBpbWFnZS0+ZHgsIGlt
YWdlLT5keSwgaW1hZ2UtPndpZHRoLCANCj4+IGltYWdlLT5oZWlnaHQpOyBcDQo+PiArwqDC
oMKgIH0NCj4+ICsNCj4+ICsjZGVmaW5lIEZCX0dFTl9ERUZBVUxUX0RFRkVSUkVEX0lPX09Q
UyhfX3ByZWZpeCwgX19kYW1hZ2VfcmFuZ2UsIA0KPj4gX19kYW1hZ2VfYXJlYSkgXA0KPj4g
K8KgwqDCoCBfX0ZCX0dFTl9ERUZBVUxUX0RFRkVSUkVEX09QU19SRFdSKF9fcHJlZml4LCBf
X2RhbWFnZV9yYW5nZSwgaW8pIFwNCj4+ICvCoMKgwqAgX19GQl9HRU5fREVGQVVMVF9ERUZF
UlJFRF9PUFNfRFJBVyhfX3ByZWZpeCwgX19kYW1hZ2VfYXJlYSwgY2ZiKQ0KPj4gKw0KPj4g
KyNkZWZpbmUgRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfU1lTX09QUyhfX3ByZWZpeCwgX19k
YW1hZ2VfcmFuZ2UsIA0KPj4gX19kYW1hZ2VfYXJlYSkgXA0KPj4gK8KgwqDCoCBfX0ZCX0dF
Tl9ERUZBVUxUX0RFRkVSUkVEX09QU19SRFdSKF9fcHJlZml4LCBfX2RhbWFnZV9yYW5nZSwg
c3lzKSBcDQo+PiArwqDCoMKgIF9fRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfT1BTX0RSQVco
X19wcmVmaXgsIF9fZGFtYWdlX2FyZWEsIHN5cykNCj4+ICsNCj4+ICsvKg0KPj4gKyAqIElu
aXRpYWxpemVzIHN0cnVjdCBmYl9vcHMgZm9yIGRlZmVycmVkIEkvTy4NCj4+ICsgKi8NCj4+
ICsNCj4+ICsjZGVmaW5lIF9fRkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfUkRXUihfX3ByZWZp
eCkgXA0KPj4gK8KgwqDCoCAuZmJfcmVhZMKgwqDCoCA9IF9fcHJlZml4ICMjIF9kZWZpb19y
ZWFkLCBcDQo+PiArwqDCoMKgIC5mYl93cml0ZcKgwqDCoCA9IF9fcHJlZml4ICMjIF9kZWZp
b193cml0ZQ0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19E
UkFXKF9fcHJlZml4KSBcDQo+PiArwqDCoMKgwqDCoMKgwqAgLmZiX2ZpbGxyZWN0wqDCoMKg
ID0gX19wcmVmaXggIyMgX2RlZmlvX2ZpbGxyZWN0LCBcDQo+PiArwqDCoMKgwqDCoMKgwqAg
LmZiX2NvcHlhcmVhwqDCoMKgID0gX19wcmVmaXggIyMgX2RlZmlvX2NvcHlhcmVhLCBcDQo+
PiArwqDCoMKgwqDCoMKgwqAgLmZiX2ltYWdlYmxpdMKgwqDCoCA9IF9fcHJlZml4ICMjIF9k
ZWZpb19pbWFnZWJsaXQNCj4gDQo+IEhlcmUgYWxzbyzCoCAnLmZiX2ZpbGxyZWN0JywgJy5m
Yl9jb3B5YXJlYScgYW5kICcuZmJfaW1hZ2VibGl0JyBiZWdpbiANCj4gd2l0aCBzcGFjZSwg
YnV0IEknbSBPSy4NCj4gDQo+IEknbSBhc2tpbmcgYmVjYXVzZSBJIHNlZSBvdGhlciBfX0ZC
X19ERUZBVUxUXyogbWFjcm8gYmVnaW4gd2l0aCB0YWJzLg0KPiANCj4+ICsjZGVmaW5lIF9f
RkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfTU1BUChfX3ByZWZpeCkgXA0KPj4gK8KgwqDCoCAu
ZmJfbW1hcMKgwqDCoCA9IGZiX2RlZmVycmVkX2lvX21tYXANCj4+ICsNCj4+ICsjZGVmaW5l
IEZCX0RFRkFVTFRfREVGRVJSRURfT1BTKF9fcHJlZml4KSBcDQo+PiArwqDCoMKgIF9fRkJf
REVGQVVMVF9ERUZFUlJFRF9PUFNfUkRXUihfX3ByZWZpeCksIFwNCj4+ICvCoMKgwqAgX19G
Ql9ERUZBVUxUX0RFRkVSUkVEX09QU19EUkFXKF9fcHJlZml4KSwgXA0KPj4gK8KgwqDCoCBf
X0ZCX0RFRkFVTFRfREVGRVJSRURfT1BTX01NQVAoX19wcmVmaXgpDQo+PiArDQo+PiDCoCBz
dGF0aWMgaW5saW5lIGJvb2wgZmJfYmVfbWF0aChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4+
IMKgIHsNCj4+IMKgICNpZmRlZiBDT05GSUdfRkJfRk9SRUlHTl9FTkRJQU4NCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------JzQBkA0hNnYhRHarsViFp0zK--

--------------20wMLQhe0Aqedz8dg0QP2IqP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRwqC8FAwAAAAAACgkQlh/E3EQov+AC
3Q/9HNgDF20BmyykRyKWHGNh5M/NTDaRl0lSuvSBlJUbnAZlCHFMCub/uDd0GAZFRWvMCZaukf+7
xkho5DGY8slUfjTtQdvonx9Ih8ZMH+ysbySx2vokHqJysV41neeFgC76Mi647omMUsOcBXIHenG+
VQeprIp1fjJ1L/oQSQRos7gmuNERxeoIF3IrPMW1M7b1QGBlVSd5BwU1WlrfUk9WPI6nvXK9WfzY
b0yFQe8TpzpQIPsAiYBUxWPq4oyxkb6D8ltdIwZMMHcYoHaXRgqhOwR6M9RYhaR7rWUPUibU52++
cmPlOjIoBOSJPmgGbV1GfnS8ZdxK/I8veRlmnkUBvU6q9dRzfzLjfeMy2+siykw8omDfYqGHb7+8
Rqym//8YRG/AzPrNqtNSVU3Mte5pVx7H4scS9ACcEsgwyhTL+0Sm1OOgF7PoBYx0F2QlEPb2CUzA
L7XQh5591A/Af+9uLRemv3Jmt34PYAEhteK0ERLBLdG40nCVdfSThvYFFeuCUP54VwlLxs32TGT6
71KiEGzJhw9LD9O15WLkgREh5zXxTtCi8bQ/vQuT0e7p+K9FKtc/+wLRmyatSJyyjtsQP07zrzcc
VaNr7I3HtV8LhqalWvXIvAMgzb2jP2veophqLkxJRn52Zm8HhBE+S1j9RVb9SbSXBgdZYqY979cI
WWc=
=7MaM
-----END PGP SIGNATURE-----

--------------20wMLQhe0Aqedz8dg0QP2IqP--
