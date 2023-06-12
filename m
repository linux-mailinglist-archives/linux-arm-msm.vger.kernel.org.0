Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3840A72C1EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 13:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjFLLB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 07:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237087AbjFLLBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 07:01:04 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26392E77
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 03:48:11 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D956E2032C;
        Mon, 12 Jun 2023 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686566889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FCu663PTlSNkarxlW2wY1sOHN+ZqnR9ZrvySsxDsNDw=;
        b=c6N4nHtr4BYpv6vypswiPQ2TEq/EKmF1bB7gSwwW9zze6DxPdpQ26evKbsslOO9stMU8Hq
        EaqOs0O9avKdoHy8LOKsmJxxrGuivdjTcym4vtDM+npa7Hb37z7h6Wd9z1bIaMb8udfDcV
        5mk9ZKdpRde+xAYQF4toYxhKNatOddk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686566889;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FCu663PTlSNkarxlW2wY1sOHN+ZqnR9ZrvySsxDsNDw=;
        b=dlvgroL1tdwrcEfR8N9caFJEJx/+Mks1skTJXg/sHuYMV1Fus1kzH+4jylyc1ghvgnwib1
        YqzWElDOqA+CmLCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6E73138EC;
        Mon, 12 Jun 2023 10:48:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /SHVJ+n3hmSVNAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 10:48:09 +0000
Message-ID: <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
Date:   Mon, 12 Jun 2023 12:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h50Diuz4wHRKWuFPd1suWAbq"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h50Diuz4wHRKWuFPd1suWAbq
Content-Type: multipart/mixed; boundary="------------xWMVhzm8eIvZf8hieMRm6Pfw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org, Degdag Mohamed
 <degdagmohamed@gmail.com>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Message-ID: <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
In-Reply-To: <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>

--------------xWMVhzm8eIvZf8hieMRm6Pfw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDYuMjMgdW0gMTE6MTQgc2NocmllYiBNYXJpam4gU3VpanRlbjoNCj4g
T24gMjAyMy0wNi0xMiAwNjoxNjoxNSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4+IFNp
bmNlIGNvbW1pdCA5M2U4MWUzOGUxOTcgKCJkcm0vZmJfaGVscGVyOiBNaW5pbWl6ZSBkYW1h
Z2UtaGVscGVyDQo+PiBvdmVyaGVhZCIpIHRoZSBkcm1fZmJfaGVscGVyX2Z1bmNzOjpmYl9k
aXJ0eSBoZWxwZXIgaXMgcmVxdWlyZWQgZm9yDQo+PiBwcm9wZXIgZGlydHkvZGFtYWdlIHBy
b2Nlc3NpbmcuIFRoZSBkcm0vbXNtIGRyaXZlciByZXF1aXJlcyB0aGF0IHRvDQo+PiBmdW5j
dGlvbiB0byBsZXQgQ01EIHBhbmVscyB0byB3b3JrLiBVc2Ugc2ltcGxpZmllZCB2ZXJzaW9u
IG9mDQo+PiBkcm1fZmJkZXZfZ2VuZXJpY19oZWxwZXJfZmJfZGlydHkoKSB0byBmaXggc3Vw
cG9ydCBmb3IgQ01EIG1vZGUgcGFuZWxzLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBEZWdkYWcg
TW9oYW1lZCA8ZGVnZGFnbW9oYW1lZEBnbWFpbC5jb20+DQo+PiBGaXhlczogOTNlODFlMzhl
MTk3ICgiZHJtL2ZiX2hlbHBlcjogTWluaW1pemUgZGFtYWdlLWhlbHBlciBvdmVyaGVhZCIp
DQo+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFy
by5vcmc+DQo+IA0KPiBUaGFua3MsIHRoaXMgc29sdmVzIHRoZSBmb2xsb3dpbmcgd2Fybmlu
ZzoNCj4gDQo+ICAgICAgbXNtX2RwdSBhZTAxMDAwLmRpc3BsYXktY29udHJvbGxlcjogZHJt
X1dBUk5fT05fT05DRSghaGVscGVyLT5mdW5jcy0+ZmJfZGlydHkpDQo+ICAgICAgV0FSTklO
RzogQ1BVOiAwIFBJRDogOSBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jOjM4
MSBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3JrKzB4MWMwLzB4MjBjDQo+IA0KPiBSZXZpZXdl
ZC1ieTogTWFyaWpuIFN1aWp0ZW4gPG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPg0K
PiANCj4gTm90ZSB0aGF0IGRybV9mYl9oZWxwZXJfZnVuY3MgZG9jdW1lbnRzIHRoaXMgYXMg
IlRoaXMgY2FsbGJhY2sgaXMNCj4gb3B0aW9uYWwiOiBpcyBpdCBubyBsb25nZXIgb3B0aW9u
YWwsIG9yIGFyZSB3ZSBlbmFibGluZyBhIGRhbWFnZSBmZWF0dXJlDQo+IHRoYXQgbWFrZXMg
aXQgbm90LW9wdGlvbmFsPw0KDQpJdCBpcyBvcHRpb25hbCBpbiB0aGUgc2Vuc2UgdGhhdCBt
b3N0IGhhcmR3YXJlIGFuZCBkcml2ZXJzIGRvbid0IHJlcXVpcmUgDQpkYW1hZ2UgaGFuZGxp
bmcuIFRob3NlIHRoYXQgZG8sIGFsc28gcmVxdWlyZSB0aGlzIGNhbGxiYWNrLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAtIE1hcmlqbg0KPiANCj4+IC0tLQ0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jIHwgMjAgKysrKysrKysrKysrKysrKysr
KysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2ZiZGV2LmMNCj4+IGluZGV4IGZhOWMxY2JmZmFlMy4uYjkzM2E4NTQy
MGY2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYw0KPj4gQEAgLTEzOSw4
ICsxMzksMjggQEAgc3RhdGljIGludCBtc21fZmJkZXZfY3JlYXRlKHN0cnVjdCBkcm1fZmJf
aGVscGVyICpoZWxwZXIsDQo+PiAgIAlyZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0KPj4g
K3N0YXRpYyBpbnQgbXNtX2ZiZGV2X2ZiX2RpcnR5KHN0cnVjdCBkcm1fZmJfaGVscGVyICpo
ZWxwZXIsDQo+PiArCQkJICAgICAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXApDQo+PiAr
ew0KPj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gaGVscGVyLT5kZXY7DQo+PiArCWlu
dCByZXQ7DQo+PiArDQo+PiArCS8qIENhbGwgZGFtYWdlIGhhbmRsZXJzIG9ubHkgaWYgbmVj
ZXNzYXJ5ICovDQo+PiArCWlmICghKGNsaXAtPngxIDwgY2xpcC0+eDIgJiYgY2xpcC0+eTEg
PCBjbGlwLT55MikpDQo+PiArCQlyZXR1cm4gMDsNCj4+ICsNCj4+ICsJaWYgKGhlbHBlci0+
ZmItPmZ1bmNzLT5kaXJ0eSkgew0KPj4gKwkJcmV0ID0gaGVscGVyLT5mYi0+ZnVuY3MtPmRp
cnR5KGhlbHBlci0+ZmIsIE5VTEwsIDAsIDAsIGNsaXAsIDEpOw0KPj4gKwkJaWYgKGRybV9X
QVJOX09OQ0UoZGV2LCByZXQsICJEaXJ0eSBoZWxwZXIgZmFpbGVkOiByZXQ9JWRcbiIsIHJl
dCkpDQo+PiArCQkJcmV0dXJuIHJldDsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9m
dW5jcyBtc21fZmJfaGVscGVyX2Z1bmNzID0gew0KPj4gICAJLmZiX3Byb2JlID0gbXNtX2Zi
ZGV2X2NyZWF0ZSwNCj4+ICsJLmZiX2RpcnR5ID0gbXNtX2ZiZGV2X2ZiX2RpcnR5LA0KPj4g
ICB9Ow0KPj4gICANCj4+ICAgLyoNCj4+IC0tIA0KPj4gMi4zOS4yDQo+Pg0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEg
TnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJl
dyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykN
Cg==

--------------xWMVhzm8eIvZf8hieMRm6Pfw--

--------------h50Diuz4wHRKWuFPd1suWAbq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSG9+gFAwAAAAAACgkQlh/E3EQov+Bq
XRAAyewe+swtnjV3LrQT6b+db+AgXlmF59zmCm1ZRfRgMgsTh8bXYHR5psdnrJn1PxBtjFqVY9Ro
Sjsyk4nbZ+RLGHN1nPbBxwjOd89Dfm273hPHr21MmWkaVlGJZCHzTBU0kpnCD03Fgro0iYVxyqGL
VXLlYimCvSYTSi5b1w/ihrcvNcvHIM0SNkNF8B2uP5TzDWr3xdeYehZetiGf2WqL6Rz546ypHLnO
yiBzKSmBpXIQbR5bCH5cfYUiK/zCB2vVNvWKuWLIPanhQiklGmhoNk3liL8pU/1YoXOsEQ3QPXKr
ibq1KUYpCYwdU5KlTA1ihSRwj+8FzJ5sydSJ5l/6VU23Kn043teU5IJ8CcPOY37qdJm+2avSFaEY
MZLva9UQSYsqUtIy0amsYLn+oNSml9IWNKWxtsH6LGX0DgW9crzci/7Kf2DWAZpGK2Ueq+xB7U+j
zdjX+dKvDQF9RJFEfCfXvqLlDyALKBHAZ7fbBdhAu8VFZFTgGeT6A6skIkO02G7RylBDMRaewe35
vK81rfnWyEd13OpIbif80khSVgy/thzkuCLkSuHiBmyBmssMs+53G6dY4joo+mghrc11aDVmXJ5c
WC8y8dHj48nUmeXfMobNpAKlElBw5Nye0FCgnbY+UaZ94SpLg1lcvJfyWJxlp0xgfbDCc3Dr+K3S
LSg=
=mEr3
-----END PGP SIGNATURE-----

--------------h50Diuz4wHRKWuFPd1suWAbq--
